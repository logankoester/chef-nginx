package('nginx') { action :install }

if node['nginx']['supervisor']
  supervisor_service 'nginx' do
    command '/usr/bin/nginx'
    action [:enable, :start]
  end
else
  service 'nginx' do
    supports status: true, start: true, stop: true, restart: true, reload: true
    action [:enable, :start]
  end
end

directory '/etc/nginx/sites' do
  action :create
end

template '/etc/nginx/nginx.conf' do
  mode '0644'
  source 'nginx.conf.erb'
  if node[:nginx][:supervisor]
    notifies :reload , resources(:supervisor_service => 'nginx')
  else
    notifies :reload, resources(:service => 'nginx')
  end
end
