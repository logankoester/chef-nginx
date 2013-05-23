#
# Cookbook Name:: nginx
# Recipe:: root_redirect
#
# Copyright (C) 2013 Logan Koester
# 
# All rights reserved - Do Not Redistribute
#

template '/etc/nginx/sites/root_redirect.conf' do
  mode '0644'
  source 'root_redirect.conf.erb'
  notifies :reload, resources(:service => 'nginx')
end
