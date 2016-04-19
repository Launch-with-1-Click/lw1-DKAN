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
  cookbook_file "/tmp/profile.tgz" do
    source File.join(node[:lw1_dkan][:profile], node[:lw1_dkan][:install][:version], 'profile.tgz' )
  end

  bash "extract_custom_profile" do
    code <<-EOL
      tar xvzf /tmp/profile.tgz --strip=1 -C /usr/local/src/dkan
      chown apache.apache -R  /usr/local/src/dkan
    EOL
  end
end


bash "build_dkan" do
  cwd "/usr/local/src/dkan"
  code <<-EOL
    rm -rf /var/www/html
    /usr/local/bin/drush make -v --prepare-install #{node[:lw1_dkan][:makefile]} /var/www/html
  EOL
  returns [0]
  retries 2
  timeout 7200
  notifies :run, 'bash[chown_dkan_wwwroot]'
end

unless node[:lw1_dkan][:profile] == 'dkan'
  bash "copy custom profile" do
    cwd "/usr/local/src/dkan"
    code <<-EOL
      mkdir -p /var/www/html/profile/#{node[:lw1_dkan][:profile]}
      tar xvzf /tmp/profile.tgz --strip=1 -C /var/www/html/profile/#{node[:lw1_dkan][:profile]}
    EOL
    notifies :run, 'bash[chown_dkan_wwwroot]'
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
