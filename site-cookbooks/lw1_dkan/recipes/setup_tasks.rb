directory "/opt/lw1/tasks" do
  action :create
  recursive true
end

template "/opt/lw1/tasks/first_boot.rb" do
  source "tasks/first_boot.erb"
end

cookbook_file "/opt/lw1/tasks/date.ini.erb" do
  source "lw1_tasks/date.ini.erb"
end

file "/var/www/html/install_amiage.php" do
  owner "apache"
  group "apache"
  content "Step 1/2: Initializing the dcan... It takes about 5-10 minutes."
end

cookbook_file "/opt/lw1/tasks/install_amiage.php.erb" do
  source "lw1_tasks/install_amiage.php.erb"
end

cron "setup_dkan_on_init" do
  action :create
  time :reboot
  command "/opt/chef/bin/chef-apply /opt/lw1/tasks/first_boot.rb > /dev/null 2>&1"
end
