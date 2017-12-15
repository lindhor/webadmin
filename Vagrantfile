# Login master
# https://...:8000
# user: root
# pwd: admin

# rubocop:disable Metrics/BlockLength
Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant'
  config.ssh.pty = true
  config.vm.box = 'centos/7'

  config.vm.define 'master', primary: true do |c|
    c.vm.hostname = 'master.local'
    c.vm.network 'forwarded_port', guest: 8000, host: 8000
    c.vm.provider 'virtualbox' do |v, _override|
      v.name = 'master'
      v.cpus = '2'
      v.memory = '4096'
      v.linked_clone = true
      v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      v.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
      v.customize ['modifyvm', :id, '--vram', '32']
    end
    c.vm.provision :ansible do |ansible|
      ansible.playbook = 'ansible/site.yml'
      ansible.become = true
      ansible.verbose = false
      ansible.limit = :all
    end
  end

  config.vm.define 'node', primary: true do |c|
    c.vm.hostname = 'node.local'
    c.vm.provider 'virtualbox' do |v, _override|
      v.name = 'node'
      v.cpus = '1'
      v.memory = '2048'
      v.linked_clone = true
      v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      v.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
      v.customize ['modifyvm', :id, '--vram', '32']
    end
  end
end
