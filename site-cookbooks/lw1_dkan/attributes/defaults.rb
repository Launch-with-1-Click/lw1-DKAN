## Sum = Sha256
# https://github.com/NuCivic/dkan/archive/7.x-1.13.3.tar.gz
default[:lw1_dkan][:install] = {
  version: '7.x-1.13.3',
  checksum: "0e662210eca75aa0a9945a8a9a082f85b13f9f7622b1ed7c936432c2aeb52b79",
  base_url: "https://github.com/NuCivic/dkan/archive/"
}

default[:lw1_dkan][:install][:download_url] = [
  node[:lw1_dkan][:install][:base_url],
  "#{node[:lw1_dkan][:install][:version]}.tar.gz"
].join("/")

default[:lw1_dkan][:profile] = 'dkan'
default[:lw1_dkan][:custom_makefile] = 'build-dkan.make'
