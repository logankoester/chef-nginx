package('php') { action :install }
package('php-fpm') { action :install }
package('php-gd') { action :install }

template '/etc/php/php.ini' do
  mode '0644'
  source 'php.ini.erb'
end

template '/etc/php/php-fpm.conf' do
  mode '0644'
  source 'php-fpm.conf.erb'
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
