#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

package('nginx') { action :install }

service 'nginx' do
  provider Chef::Provider::Service::Systemd if node['platform'] == 'arch'
  supports status: true, start: true, stop: true, restart: true, reload: true
  action [:enable, :start]
end

directory '/etc/nginx/sites' do
  action :create
end

template '/etc/nginx/nginx.conf' do
  mode '0644'
  source 'nginx.conf.erb'
  notifies :reload, resources(:service => 'nginx')
end
