require 'spec_helper'

describe 'nginx::php_fpm' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  cached(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs the php, php-fpm and php-gd packages' do
    expect(chef_run).to install_package 'php'
    expect(chef_run).to install_package 'php-fpm'
    expect(chef_run).to install_package 'php-gd'
  end

  it 'creates php-fpm.conf' do
    expect(chef_run).to render_file '/etc/php/php-fpm.conf'
  end

  it 'enables the php-fpm service' do
    expect(chef_run).to enable_service 'php-fpm'
  end

  it 'starts the php-fpm service' do
    expect(chef_run).to start_service 'php-fpm'
  end
end
