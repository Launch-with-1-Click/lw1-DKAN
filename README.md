# Launch with 1-click DKAN

## Setup

Export enviromnent variavles below.

```
export AWS_ACCESS_KEY='AKIAIXXXXXXXXXXXXXXXX'
export AWS_SECRET_ACCESS_KEY='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
export AWS_EC2_KEYPAIR='YOUR_KEYPAIR_NAME_ON_EC2_CONSOLE'
export AWS_EC2_KEYPASS='PATH_TO_SSH_KEY'
export AWS_REGION='ap-northeast-1'
export PRODUCT_VERSION=7.x-1.12.5 ## (Optional: it is used by instance name tag.)
```


## Test with Vagrant

To create an instance and commmon settings.

```
$ vagrant up (default|annai)
```

Rerun after update recipe.

```
$ vagrant rsync (default|annai)
$ vagrant provision (default|annai) --provision-with chef_solo
```

To emulate first boot on AMI. It runs chef-apply (`chef-apply /opt/lw1/tasks/first_boot.rb`).

```
$ vagrant reload (default|annai)
```


Destroy the instance.

```
$ vagrant destroy (default|annai)
```
