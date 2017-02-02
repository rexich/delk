# Attributes for Docker

default["docker"]["kernel_release"] = `uname -r`.chomp
default["docker"]["ubuntu_release"] = `lsb_release -cs`.chomp
