package('php') { action :install }
package('php-fpm') { action :install }

template '/etc/php/php.ini' do
  mode '0644'
  source 'php.ini.erb'
  if node[:nginx][:supervisor]
    notifies :reload , resources(:supervisor_service => 'php-fpm')
  else
    notifies :reload, resources(:service => 'php-fpm')
  end
end

template '/etc/php/php-fpm.conf' do
  mode '0644'
  source 'php-fpm.conf.erb'
  if node[:nginx][:supervisor]
    notifies :reload , resources(:supervisor_service => 'php-fpm')
  else
    notifies :reload, resources(:service => 'php-fpm')
  end
end

if node['nginx']['supervisor']
  supervisor_service 'php-fpm' do
    command '/usr/bin/php-fpm -F'
    action [:enable, :start]
  end
else
  service 'php-fpm' do
    supports status: true, start: true, stop: true, restart: true, reload: true
    action [:enable, :start]
  end
end
