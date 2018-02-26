# wolkenkit-vm

wolkenkit-vm is a Packer script to setup virtual machines that run wolkenkit.

## Installation

To setup virtual machines you first need to install [Packer](https://www.packer.io/) on your machine. Depending on which platforms you want to build virtual machines for, you must also install [VMware](https://www.vmware.com/) or [VirtualBox](https://www.virtualbox.org/) (or both).

## Quick start

To build virtual machines for VMware and VirtualBox run:

```shell
$ packer build build.json
```

To build a virtual machine only for VMware run:

```shell
$ packer build --only=vmware-iso build.json
```

To build a virtual machine only for VirtualBox run:

```shell
$ packer build --only=virtualbox-iso build.json
```

Afterwards, use the `.ovf` file in the `output-vmware-iso` or `output-virtualbox-iso` directory to create a new virtual machine in VMware or VirtualBox respectively.

### Configuring the build

You may need to adjust the versions of nvm, Node.js or wolkenkit. For that, provide the `-var` flag and set `nvm_version`, `node_version` or `wolkenkit_version` to the desired value, e.g.:

```shell
$ packer build -var 'wolkenkit_version=1.2.1' build.json
```

Alternatively, you may change the appropriate lines in the file `build.json`.

### Using SSH

The virtual machine for VirtualBox automatically forwards the following ports for SSH and wolkenkit:

Virtual machine | Host
-|-
22 | 2222
3000 | 3000
3001 | 3001
3002 | 3002
3003 | 3003

To connect via SSH to the virtual machine, run the following command. The default password is `wolkenkit`:

```shell
$ ssh wolkenkit@localhost -p 2222
```

## License

Copyright (c) 2017-2018 the native web.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program. If not, see [GNU Licenses](http://www.gnu.org/licenses/).
