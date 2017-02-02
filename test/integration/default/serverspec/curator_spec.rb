require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package("elasticsearch-curator") do
  it { should be_installed }
end

describe file("/etc/cron.d/curator-maintenance") do
  it { should be_file }
  it { should be_mode 755 }
  its(:content) { should match /curator/ }
end
