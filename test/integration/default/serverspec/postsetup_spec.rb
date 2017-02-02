require "serverspec"
require "helper.rb"


# Required by serverspec
set :backend, :exec


# Check Docker Compose file's ownership
describe file("#{HOME_DIR}/docker-compose.yml") do
  it { should be_file }
  it { should be_owned_by DELK_USER }
  it { should be_grouped_into DELK_USER }
end


# Check sysctl configuration file's permissions, contents, and ownership
describe file("/etc/rsyslog.d/99-emit-logs.conf") do
  it { should be_file }
  it { should be_owned_by "root" }
  it { should be_grouped_into "root" }
  it { should be_mode 644 }
  its(:content) { should match /\*\.\*\s+@@localhost:5000/ }
end


# Check Upstart service file's permissions and ownership
describe file("/etc/init/delk.conf") do
  it { should be_file }
  it { should be_owned_by "root" }
  it { should be_grouped_into "root" }
  it { should be_mode 644 }
  its(:content) { should match /docker-compose up -d/ }
end


# Check if the Docker and DELK services are enabled and started
%w( docker delk ).each do |svc|
  describe service(svc) do
    it { should be_enabled }
    it { should be_running }
  end
end


# Check if ports are open
%w( 5000 5601 9200 9300 ).each do |p|
  describe port(p) do
      it { should be_listening }
  end
end
