# Login master
# https://...:8000
# user: root
# pwd: admin

NODES = 2

# define vagrant instances
Vagrant.configure('2') do |config|
  config.vm.provider(:virtualbox) { |a, b| configure_virtualbox(a, b) }
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.ssh.pty = true
  (1..NODES).each do |i|
    config.vm.define fqdn(i), primary: i == 1 do |n|
      configure_instance n, i
      provision_system(n) if i == NODES
    end
  end
end

# Configure VirtualBox settings
def configure_virtualbox(vbox, override)
  override.vm.box = 'centos/7'
  vbox.memory = 4096
  vbox.cpus = '1'
  vbox.linked_clone = true
  vbox.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  vbox.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
  vbox.customize ['modifyvm', :id, '--vram', '32']
end

# Configure a given instance
def configure_instance(node, i)
  node.vm.hostname = fqdn(i)
  network_ports node, i
end

def network_ports(node, i)
  baseport = 8000 # 8000, 8100...
  node.vm.network 'forwarded_port',
                  guest: baseport,
                  host: baseport + 0 + (i - 1) * 100
  baseport = 80 # 8080, 8180...
  node.vm.network 'forwarded_port',
                  guest: baseport,
                  host: baseport + 8000 + (i - 1) * 100
end

# Get the hostname for a given node number
def host(i)
  "node#{i}"
end

# Get the FQDN for a given node number
def fqdn(i)
  "#{host(i)}.local"
end

# Provision the whole system
def provision_system(node)
  node.vm.provision :ansible do |ansible|
    ansible.playbook = 'ansible/site.yml'
    ansible.become = true
    ansible.verbose = false
    ansible.limit = :all
    ansible.groups = {
      'master' => [fqdn(1)],
      'node' => [fqdn(2)]
    }
  end
end
