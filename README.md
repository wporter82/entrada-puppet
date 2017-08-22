# Entrada VM via puppet

## Setup
You should have the latest version of the following apps installed.

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Clone the repository to a location on your local machine and start the vm:

```
git clone https://github.com/wporter82/entrada-puppet.git
cd entrada-puppet
vagrant up
```

You will need to set up Entrada on your system by opening a browser to:

http://{your_ip_address}:8080

*NOTE: If port 8080 isn't available, vagrant will warn you and choose a
different one. The output of 'vagrant up' will indicate this.*

## Configuration

Most of the text boxes on the setup screen will be filled in for you

* The port number needs to be added to the address

![Step 2](/images/step2.jpg)


* The MySql password is 'pass123'

![Step 3](/images/step3.jpg)


* Fill out your admin account info

![Step 4](/images/step4.jpg)


* Add configured rules to .htaccess file

![Step 5](/images/step5.jpg)


Copy the text in the box and then paste it into the .htaccess file by following
the steps below

From the command line:
```
vagrant ssh
cd public_html/www-root/
touch .htaccess
nano .htaccess
```
Paste the contents into the editor window
CTL+X to Exit, making sure to choose 'Y' to save
