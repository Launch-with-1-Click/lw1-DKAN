# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "dummy"


  ## AWS
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    aws.keypair_name = ENV['AWS_EC2_KEYPAIR']
    aws.user_data = "#!/bin/bash\nsed -i -e 's/^Defaults.*requiretty/# Defaults requiretty/g' /etc/sudoers"

    aws.region = ENV['AWS_REGION']
    aws.instance_type = 'c3.2xlarge'
    case ENV['AWS_REGION']
    when 'ap-northeast-1'
      aws.ami = 'ami-374db956' # Amazon Linux AMI 2016.03.3 (HVM), SSD Volume Type
    when 'us-east-1'
      aws.ami = 'ami-6869aa05' # Amazon Linux AMI 2016.03.3 (HVM), SSD Volume Type
    else
      raise "Unsupported region #{ENV['AWS_REGION']}"
    end

    override.ssh.username = "ec2-user"
    override.ssh.private_key_path = ENV['AWS_EC2_KEYPASS']
  end

  config.ssh.pty = true

  config.vm.provision :shell, :path => "chef_prepare.sh"

  def common_provisioning_chef(chef)
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.add_recipe 'simplelog_handler::default'
    chef.add_recipe 'lw1_dkan::drush'
    chef.add_recipe 'lw1_dkan::pre_packages'
    chef.add_recipe 'lw1_dkan::dkan'
    chef.add_recipe 'lw1_dkan::setup_tasks'
    yield if block_given?
  end

  config.vm.define(:default) do |node|
    node.vm.provider :aws do |aws, override|
      aws.tags = {
        'Name' => "DKAN Default #{ENV['PRODUCT_VERSION']} (Developed by #{ENV['USER']})"
      }
    end
    config.vm.provision :chef_solo do |chef|
      common_provisioning_chef(chef)
    end
  end

  config.vm.define(:annai) do |node|
    node.vm.provider :aws do |aws, override|
      aws.tags = {
        'Name' => "DKAN Annnai #{ENV['PRODUCT_VERSION']} (Developed by #{ENV['USER']})"
      }
    end

    ## Sction Provisioning
    config.vm.provision :chef_solo do |chef|
      common_provisioning_chef(chef) do
        chef.json = {
          "lw1_dkan" => {
#            "install" => {
#              "version" => "7.x-1.10",
#              "checksum" => "1e25f71aef29c1d778e984b1ebbf1e4b1a1aa30c38dc5d90fc64e9359fd97cbb"
#            },
            "profile" => 'dkan_japanese',
            "custom_makefile" => 'build-dkan_japanese.make'
          }
        }
      end
    end
  end
end
