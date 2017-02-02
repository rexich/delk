require "serverspec"
require "helper.rb"


# Required by serverspec
set :backend, :exec


# Check directories' ownership
%w( . conf data ).each do |dir|
  describe file("#{HOME_DIR}/logstash/#{dir}") do
    it { should be_directory }
    it { should be_owned_by DELK_USER }
    it { should be_grouped_into DELK_USER }
  end
end


# Check configuration files' ownership
%w( Dockerfile conf/logstash.conf ).each do |file|
  describe file("#{HOME_DIR}/logstash/#{file}") do
    it { should be_file }
    it { should be_owned_by DELK_USER }
    it { should be_grouped_into DELK_USER }
  end
end


# Check if the Docker image is pulled
describe docker_image('logstash:5') do
  it { should exist }
end
