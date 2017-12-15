# Login master
# https://...:8000
# user: root
# pwd: admin

# rubocop:disable Metrics/BlockLength
Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant'
  config.ssh.pty = true
  config.vm.box = 'centos/7'

  config.vm.define 'server', primary: true do |c|
    c.vm.hostname = 'server.local'
    c.vm.network 'forwarded_port', guest: 8000, host: 8000
    c.vm.network 'forwarded_port', guest: 80, host: 8080
    c.vm.provider 'virtualbox' do |v, _override|
      v.name = 'server'
      v.cpus = '2'
      v.memory = '4096'
      v.linked_clone = true
      v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      v.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
      v.customize ['modifyvm', :id, '--vram', '32']
    end
  end

  config.vm.define 'client' do |c|
    c.vm.hostname = 'client.local'
    c.vm.provider 'virtualbox' do |v, _override|
      v.name = 'client'
      v.cpus = '1'
      v.memory = '2048'
      v.linked_clone = true
      v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      v.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
      v.customize ['modifyvm', :id, '--vram', '32']
    end
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'ansible/site.yml'
    ansible.become = true
    ansible.verbose = false
    ansible.groups = {
      'master' => ['server'],
      'node' => ['client']
    }
  end
end
