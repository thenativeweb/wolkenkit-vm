# wolkenkit-vm

wolkenkit-vm is a Packer script to setup virtual machines that run wolkenkit.

**Please note that this repository is currently not maintained, and that the code does not work.**

**This script should only be used for testing and development purposes. It is not built for live enviroments.**

VM image is based on ubuntu 16.04.3 server.
The VirtualBox image has added port forwarding rules for ssh and wolkenkit ports.
- 2222:22
- 3000:3000
- 3001:3001
- 3002:3002
- 3003:3003

In order to connect to the VM via ssh, you can run `ssh wolkenkit@localhost -p 2222`. The default password is `wolkenkit`.

## Build images

- Run `packer build build.json` to build VMware and VirtualBox machines
    - Only build VirtualBox: `packer build --only=virtualbox-iso build.json`
    - Only build VMware: `packer build --only=vmware-iso build.json`
- Pass one or more `var` parameters in order to change the default version of nvm, Node.js or wolkenkit
    - `packer build --only=virtualbox-iso -var 'wolkenkit_version=1.2.1' -var 'nvm_version=v0.33.7' -var 'node_version=v9' build.json`
 - Defaults are:
    - nvm: v0.33.8
    - Node.js: v8
    - wolkenkit: latest
- Open/Import `output-<virtualbox|vmware>-iso/packer-<virtualbox|vmware>-iso-<number>.ovf`
- Start VM 

## TODOs

- [ ] Generate SSH keys for VM
- [ ] Generate random user password
- [ ] Figure out if port forwarding can be added for VMware too