# Entrada VM via puppet

## Setup
You should have the latest version of the following apps installed.

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Clone the repository to a location on your local machine and start the vm:

```
git clone https://github.com/wporter82/entrada-puppet.git
vagrant up
```

You will need to set up Entrada on your system by opening a browser to:

http://{your_ip_address}:8080

*NOTE: If port 8080 isn't available, vagrant will warn you and choose a
different one. The output of 'vagrant up' will indicate this.*

Most of the text boxes on the setup screen will be filled in for you with the
following exceptions:

* The port number needs to be added to the address
* The MySql password is 'pass123'
