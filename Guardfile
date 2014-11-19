guard 'rspec', cmd: 'bundle exec rspec' do
  watch(%r{.*\.rb})
  watch(%r{.*\.erb})
end

guard 'foodcritic', :cli => '--epic-fail any', cookbook_paths: '.' do
  watch(%r{.*\.rb})
  watch(%r{.*\.erb})
end
