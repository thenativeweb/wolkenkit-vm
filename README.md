# wolkenkit-vm

wolkenkit-vm is a Packer script to setup virtual machines that run wolkenkit.

**Please note that this repository is currently not maintained, and that the code does not work.**

**This script should only be used for testing and development purposes. It is not built for live enviroments.**

VM image is based on ubuntu 16.04.3 server.

- Run `packer build build.json`
- Open/Import `output-virtualbox-iso/packer-virtualbox-iso-<number>.ovf`
- Change network to `bridge`
- Start vm 

## TODOs

- [ ] Generate SSH keys for vm, set random user password
- [ ] Proper networking configuration (set bridge network after creation manually)
- [ ] Get `wolkenkit start` running
- [ ] Get rid of deprecated warnings for ansible
- [ ] Add more builders (VMWare,...)
- [ ] ...