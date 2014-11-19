require 'spec_helper'

describe 'nginx::user' do
  before do
    Fauxhai.mock(path: 'spec/fixtures/arch.json') do |node|
    end
  end

  cached(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it 'creates an http group' do
    expect(chef_run).to create_group('http').with(
      members: ['http']
    )
  end

  it 'creates an http user with home at /app' do
    expect(chef_run).to create_user('http').with(home: '/app')
    expect(chef_run).to create_directory('/app').with(
      user: 'http',
      group: 'http'
    )
  end

  it 'creates a www/ directory in the http user home' do
    expect(chef_run).to create_directory('/app/www').with(
      user: 'http',
      group: 'http'
    )
  end

end
