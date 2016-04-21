## Sum = Sha256
default[:lw1_dkan][:install] = {
  version: '7.x-1.11',
  checksum: "9c4f4696932a8d11878be7cfdf3c0f8edc5fadb5fb8b1643a181f176a1c408aa",
  base_url: "https://github.com/NuCivic/dkan/archive/"
}

default[:lw1_dkan][:install][:download_url] = [
  node[:lw1_dkan][:install][:base_url],
  "#{node[:lw1_dkan][:install][:version]}.tar.gz"
].join("/")

default[:lw1_dkan][:profile] = 'dkan'
default[:lw1_dkan][:custom_makefile] = 'build-dkan.make'
