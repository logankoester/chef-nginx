user 'http' do
  system true
  home '/app'
end

group 'http' do
  append true
  members ['http']
end

directory '/app' do
  owner 'http'
  group 'http'
  mode 0771
  action :create
end

directory '/app/www' do
  owner 'http'
  group 'http'
  mode 0771
  action :create
end
