require 'spec_helper'

describe 'nginx::default' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  cached(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'installs the nginx package' do
    expect(chef_run).to install_package 'nginx'
  end

  it 'creates nginx.conf' do
    expect(chef_run).to render_file '/etc/nginx/nginx.conf'
  end

  it 'enables the nginx service' do
    expect(chef_run).to enable_service 'nginx'
  end

  it 'starts the nginx service' do
    expect(chef_run).to start_service 'nginx'
  end
end
