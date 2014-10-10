package('nginx') { action :install }

directory '/etc/nginx/sites' do
  action :create
end

template '/etc/nginx/nginx.conf' do
  mode '0644'
  source 'nginx.conf.erb'
end

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
