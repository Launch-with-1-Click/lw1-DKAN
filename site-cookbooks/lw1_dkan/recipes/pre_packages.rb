## install misc packages

package 'git'
package 'patch'
package 'postfix'
package 'GeoIP'
package 'tmux'
package 'mysql56-server'

service 'sendmail' do
  action [:stop, :disable]
end

%w[
php56
php56-mysqlnd
php56-gd
php56-mcrypt
php56-mbstring
php56-xmlrpc
php56-soap
php56-intl
php56-opcache
].map do |php_m|
  package php_m
end

ruby_block "update php.ini" do
  block do
    _file = Chef::Util::FileEdit.new('/etc/php.ini')
    _file.search_file_replace_line(/^memory_limit/, "memory_limit = 1280M ;")
    _file.search_file_replace_line(/^post_max_size/, "post_max_size = 1026M ;")
    _file.search_file_replace_line(/^lesize/, "upload_max_filesize = 1024M ;")
    _file.search_file_replace_line(/^max_execution_time/, "max_execution_time = 600 ;")
    _file.search_file_replace_line(/^;mbstring.http_input/, "mbstring.http_input = pass ;")
    _file.search_file_replace_line(/^;mbstring.http_output/, "mbstring.http_output = pass ;")
    _file.write_file
  end
end

ruby_block "postfix main.cf" do
  block do
    _file = Chef::Util::FileEdit.new('/etc/postfix/main.cf')
    _file.search_file_replace_line(/^#local_recipient_maps =$/, "local_recipient_maps =")
    _file.write_file
  end
end


