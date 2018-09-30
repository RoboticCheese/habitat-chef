describe user('hab') do
  it { should exist }
  its('home') { should eq('/home/hab') }
  its('groups') { should eq(%w(hab)) }
end

describe group('hab') do
  it { should exist }
end

describe directory('/home/hab') do
  it { should exist }
  its('owner') { should eq('hab') }
  its('group') { should eq('hab') }
end

describe file('/bin/hab') do
  it { should exist }
  it { should be_symlink }
end

# This needs to be updated each time Habitat is released so we ensure we're getting the version
# required by this cookbook.
describe command('hab -V') do
  its('stdout') { should match(%r{^hab 0.63.0/}) }
  its('exit_status') { should eq 0 }
end

nginx_content = <<-EOF
worker_processes = 2

[http]
keepalive_timeout = 120
EOF

describe file('/hab/user/nginx/config/user.toml') do
  it { should exist }
  its('content') { should match(nginx_content) }
end
