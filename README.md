# vagrant-yokozuna cookbook

# Requirements

* [Oracle VM VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)
* [Berkshelf](http://berkshelf.com)

# Usage

    $ vagrant plugin install vagrant-berkshelf
    $ vagrant plugin install vagrant-vbguest
    $ git clone git@github.com:holidayworking/vagrant-yokozuna.git
    $ cd vagrant-yokozuna
    $ bundle install
    $ vagrant up
    $ vagrant ssh
    [vagrant@vagrant-yokozuna-berkshelf ~]$
    [vagrant@vagrant-yokozuna-berkshelf ~]$ cd riak-yokozuna-0.9.0-src
    [vagrant@vagrant-yokozuna-berkshelf riak-yokozuna-0.9.0-src]$ ulimit -n 4096
    [vagrant@vagrant-yokozuna-berkshelf riak-yokozuna-0.9.0-src]$ ./rel/riak/bin/riak start

# Author

Author:: Hidekazu Tanaka (<hidekazu.tanaka@gmail.com>)
