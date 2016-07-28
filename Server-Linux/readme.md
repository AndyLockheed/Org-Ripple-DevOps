# RippleOSI Server Environment

This repository contains a Vagrant and Puppet configuration for a RippleOSI Ubuntu 15 server environment.

### Prerequisites
The host is assumed to be a Windows host. The virtual machine is run in Oracle VirtualBox and initialised using Vagrant.

Download and install [VirtualBox 5.0.20](http://download.virtualbox.org/virtualbox/5.0.20/VirtualBox-5.0.20-106931-Win.exe).

Download and install [Vagrant 1.8.1](https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1.msi).

Download and install [Puppet Agent](https://downloads.puppetlabs.com/windows/puppet-agent-x64-latest.msi).

### First-Time Setup

Clone this repository to your host machine.

Open a command prompt in the directory containing your Vagrantfile.

Run the following command:

```
setup-modules.bat
``` 
 
### Usage

Open a command prompt in the directory containing your Vagrantfile.

Run the following command:

```
vagrant up
```

Once the virtual machine has been created the provisioning process will begin. If you need to rerun this at any point (for example, the provisioning was not complete due to a required restart) then run the following command:

```
vagrant provision
```

### Running puppet apply independently of vagrant (clean server already exists)

 - run setup-modules.bat on your local machine
 - copy the modules and manifests folder to the machine you to a folder of your choice
 - execute each command in configure.sh, paying special attention to `puppet apply` - the 2 paths you pass as parameters must match the directory you copied the manifests and modules to.

### Manual Steps

Deploy as per usual process:

 - copy the .war file to the server, should be called ROOT.war, and use an appropriate context.xml (a sample is provided in the custom-files directory)
 - sudo initctl stop tomcat
 - move ROOT.war to /etc/apache-tomcat/webapps
 - sudo initctl start tomcat
 - copy the context.xml into /etc/apache-tomcat/webapps/ROOT/META-INF/
 - run the database and data create scripts against the local mysql isntance.
 - you can connect to mysql using `mysql -u root`
