Vagrant.configure("2") do |config|
  config.vm.box = 'centos/8'
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vbguest.no_install = true
  N = 3

  VAGRANT_VM_PROVIDER = "virtualbox"
  ANSIBLE_RAW_SSH_ARGS = []

  (1..N-1).each do |machine_id|
    ANSIBLE_RAW_SSH_ARGS << "-o IdentityFile=.vagrant/machines/router#{machine_id}/#{VAGRANT_VM_PROVIDER}/private_key"
  end

  (1..N).each do |machine_id|
    config.vm.define "router#{machine_id}" do |machine|
      machine.vm.hostname = "router#{machine_id}"
      machine.vm.network "private_network", ip: "192.168.101.#{10+machine_id-1}"

      # Only execute once the Ansible provisioner,
      # when all the machines are up and ready.
      if machine_id == N
        machine.vm.provision :ansible do |ansible|
          # Disable default limit to connect to all the machines
          ansible.limit = "all"
          ansible.playbook = "playbook.yml"
          ansible.inventory_path = "hosts"
          ansible.raw_ssh_args = ANSIBLE_RAW_SSH_ARGS
        end
      end
    end
  end
end
