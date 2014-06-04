package('php') { action :install }
package('php-fpm') { action :install }

template '/etc/php/php.ini' do
  mode '0644'
  source 'php.ini.erb'
end

template '/etc/php/php-fpm.conf' do
  mode '0644'
  source 'php-fpm.conf.erb'
end

service 'php-fpm' do
  provider Chef::Provider::Service::Systemd if node['platform'] =~ /arch|manjaro/
  supports status: true, start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end
