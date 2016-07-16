## Sum = Sha256
default[:lw1_dkan][:install] = {
  version: '7.x-1.12.5',
  checksum: "ca7624b2fccc325c8ad5f76a157889c5ab49d6742bfeb9da7d9287a4c81c90d0",
  base_url: "https://github.com/NuCivic/dkan/archive/"
}

default[:lw1_dkan][:install][:download_url] = [
  node[:lw1_dkan][:install][:base_url],
  "#{node[:lw1_dkan][:install][:version]}.tar.gz"
].join("/")

default[:lw1_dkan][:profile] = 'dkan'
default[:lw1_dkan][:custom_makefile] = 'build-dkan.make'
