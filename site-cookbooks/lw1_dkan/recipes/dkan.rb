ark "dkan" do
  url node[:lw1_dkan][:install][:download_url]
  version node[:lw1_dkan][:install][:version]
  path "/usr/local/src"
  checksum  node[:lw1_dkan][:install][:checksum]
  owner 'apache'
  group 'apache'
  action :put
end

unless node[:lw1_dkan][:profile] == 'dkan'
  remote_directory "/usr/local/src/#{node[:lw1_dkan][:profile]}" do
    source File.join('profiles', node[:lw1_dkan][:install][:version], "#{node[:lw1_dkan][:profile]}" )
  end
end

if node[:lw1_dkan][:profile] == 'dkan'
  bash "build_dkan" do
    cwd "/usr/local/src/dkan"
    code <<-EOL
      rm -rf /var/www/html
      /usr/local/bin/drush make -v --prepare-install drupal-org-core.make --yes /var/www/html
      rsync -av . /var/www/html/profiles/dkan --exclude webroot
      /usr/local/bin/drush -y make --no-core --contrib-destination=./ drupal-org.make /var/www/html/profiles/dkan --no-recursion
    EOL
    returns [0]
    retries 2
    timeout 7200
    notifies :run, 'bash[chown_dkan_wwwroot]'
  end
else
  bash "build_dkan_with_custom_profile" do
    cwd "/usr/local/src/#{node[:lw1_dkan][:profile]}"
    code <<-EOL
      rm -rf /var/www/html
      /usr/local/bin/drush make -v --prepare-install #{node[:lw1_dkan][:custom_makefile]} --yes /var/www/html
      rsync -av /usr/local/src/dkan/ /var/www/html/profiles/dkan
      cd ../dkan && /usr/local/bin/drush -y make --no-core --contrib-destination=./ drupal-org.make /var/www/html/profiles/dkan --no-recursion
      cd ../dkan_japanese && /usr/local/bin/drush -y make --no-core --contrib-destination=./ dkan_japanese.make /var/www/html/profiles/dkan_japanese --no-recursion
    EOL
    returns [0]
    retries 5
    timeout 7200
    notifies :run, 'bash[chown_dkan_wwwroot]'
    creates "/var/www/html/profiles/#{node[:lw1_dkan][:profile]}"
  end

  %w[standard minimal].map do |dir|
    directory File.join('/var/www/html/profiles', dir) do
      action :delete
      recursive true
    end
  end
end

cookbook_file "/etc/httpd/conf.d/dkan.conf" do
  source "httpd/dkan.conf"
end

bash "chown_dkan_wwwroot" do
  action :nothing
  code <<-EOL
    chown apache.apache -R /var/www/html
  EOL
end
