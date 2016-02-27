ark "dkan" do
  url node[:lw1_dkan][:install][:download_url]
  version node[:lw1_dkan][:install][:version]
  path "/usr/local/src"
  checksum  node[:lw1_dkan][:install][:checksum]
  owner 'apache'
  group 'apache'
  action :put
end

bash "build_dkan" do
  cwd "/usr/local/src/dkan"
  code <<-EOL
    rm -rf /var/www/html
    /usr/local/bin/drush make -v --prepare-install build-dkan.make /var/www/html
  EOL
  returns [0]
  retries 2
  timeout 7200
  notifies :run, 'bash[chown_dkan_wwwroot]'
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
