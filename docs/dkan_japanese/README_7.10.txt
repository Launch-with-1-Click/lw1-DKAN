<% unless node[:lw1_dkan][:profile] == 'dkan' %>
    /usr/bin/mysql -e "CREATE DATABASE dkan DEFAULT CHARACTER SET utf8;" -D mysql
<% end %>


1. Put the content on /usr/local/src/ so the .profile file can be found like that: /usr/local/src/dkan_japanese/dkan_japanese.profile
2. Create DB.
3. Edit /usr/local/src/dkan_japanese/dbparams.json with dbname/dbuser/dbpassword (defaults to dkan_japanese/dkan/dkan)
4. Edit /usr/local/src/dkan_japanese/configure.json with admin username/password (defaults to admin/admin)
5. execute
　drush make --prepare-install build-/usr/local/src/dkan_japanese.make /var/www/destination/place
6. User can visit web browser and select Japanese.
7. They can delete the *.json files from the server (both on /usr/local/src/dkan_japanese and in /var/ww/destination/place/profiles/dkan_japanese