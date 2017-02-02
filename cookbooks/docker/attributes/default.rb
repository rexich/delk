# Attributes for Docker

default["docker"]["kernel_release"]   = `uname -r`.chomp
default["docker"]["ubuntu_release"]   = `lsb_release -cs`.chomp
default["docker"]["dependencies"]     = [
  "curl",
  "linux-image-extra-#{`uname -r`.chomp}",
  "linux-image-extra-virtual",
  "apt-transport-https",
  "ca-certificates",
  "docker-engine"
]
default["docker"]["compose_version"]  = "1.10.0"
