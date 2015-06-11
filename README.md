# ubuntu_openvswitch
## Provides openvswitch 2.3.1 debian packages build on Ubuntu 14.04.

### The following command will copy the debian packages of openvswitch into ~/openvswitch:

    $ docker run -rm -v ~/openvswitch:/openvswitch-2.3.1-build visono/ubuntu_openvswitch

### To install openvswitch execute the following commands with sudo or as root inside the ~/openvswitch folder:

    $ apt-get install bridge-utils
    $ dpkg -i openvswitch-common_2.3.1-1_amd64.deb openvswitch-switch_2.3.1-1_amd64.deb

### Very handy for docker multi host networking as described [here](http://wiredcraft.com/blog/multi-host-docker-network/)!!!