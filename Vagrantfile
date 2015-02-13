# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

def windows?
   (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'puppetlabs/centos-7.0-64-puppet'

  config.vbguest.auto_update = false if Vagrant.has_plugin?('vagrant-vbguest')

  config.vm.define 'box' do |box|
    box.vm.hostname = 'box'
    # FIXME: Vagrantがホスト名の設定をなぜかうまくやってくれない
    box.vm.provision :shell, inline: "hostnamectl set-hostname #{box.vm.hostname}"

    box.vm.provider :virtualbox do |v|
      v.cpus   = 1
      v.memory = 1024
    end

    box.vm.provision :puppet do |puppet|
      puppet.manifest_file     = 'site.pp'
      puppet.manifests_path    = 'puppet/manifests'
      puppet.module_path       = %w(puppet/modules puppet/shared)
      puppet.hiera_config_path = 'puppet/config/hiera.yaml'
      puppet.facter            = {
        :hieradata_dir => '/vagrant/puppet/hieradata',
      }
      puppet.options           = '--show_diff'
    end

  end

end
