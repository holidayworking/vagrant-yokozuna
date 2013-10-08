#
# Cookbook Name:: vagrant-yokozuna
# Recipe:: default
#
# Copyright (C) 2013 Hidekazu Tanaka
#
# All rights reserved - Do Not Redistribute
#

package 'git'

remote_file '/tmp/riak-yokozuna-0.9.0-src.tar.gz' do
  source 'http://data.riakcs.net:8080/yokozuna/riak-yokozuna-0.9.0-src.tar.gz'
  checksum '73cf9e0458cbdf0be0d6cacaa09be798d4f70c67cbb6c665a8030f675b9a994b'
  mode 0644
  action :create_if_missing
end

bash 'install-yokozuna' do
  user 'vagrant'
  group 'vagrant'
  cwd '/home/vagrant'

  code <<-EOC
    tar zxvf /tmp/riak-yokozuna-0.9.0-src.tar.gz
    cd riak-yokozuna-0.9.0-src
    make
    make stage
    sed -e 's/yokozuna = off/yokozuna = on/' -i.back rel/riak/etc/riak.conf
  EOC

  not_if { File.exists?('/home/vagrant/riak-yokozuna-0.9.0-src/rel/riak/bin/riak') }
end
