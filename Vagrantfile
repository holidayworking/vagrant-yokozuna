# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "vagrant-yokozuna-berkshelf"
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :erlang => {
        :install_method => 'source',
        :source => {
          :version  => 'R15B03',
          :url      => 'http://erlang.org/download/otp_src_R15B03-1.tar.gz',
          :checksum => '4bccac86dd76aec050252e44276a0283a0df9218e6470cf042a9b9f9dfc9476c'
        }
      },
      :java => {
        :install_flavor => "oracle",
        :oracle => {
           :accept_oracle_download_terms => true
        }
      }
    }

    chef.run_list = [
      "recipe[erlang]",
      "recipe[java]",
      "recipe[vagrant-yokozuna::default]"
    ]
  end
end
