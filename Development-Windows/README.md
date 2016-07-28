# RippleOSI Development Environment

This repository contains a Vagrant and Puppet configuration for a RippleOSI Window 10 development environment.

### Prerequisites
The host is assumed to be a Windows host. The virtual machine is run in Oracle VirtualBox and initialised using Vagrant.

Download and install [VirtualBox 5.0.20](http://download.virtualbox.org/virtualbox/5.0.20/VirtualBox-5.0.20-106931-Win.exe).

Download and install [Vagrant 1.8.1](https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1.msi).

A basebox should be identified for use (due to windows licensing). Some sample boxes exist [here](https://atlas.hashicorp.com/boxes/search?order=desc&page=1&provider=&q=windows+10&sort=downloads&utf8=%E2%9C%93)
that can be used or a pre-built VM should be targeted.

### Assumptions 
* Your SSH key is stored at C:\Users\username\\.ssh\id_rsa
* Your SSH key has an empty passphrase
* Your known\_hosts file is stored at C:\Users\username\\.ssh\known\_hosts
* Your known\_hosts file contains the thumbprint of each server you `git clone` a repository from

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

### Credentials

The default username and password is `vagrant`. 

### Manual Steps
Once the virtual machine has completed the provisioning process the following steps should allow for the application to be built and run from the command line or an IDE  
Note: The Ripple source code will be available on the local machine in directory : C:\Work\Riple

#### Context-Ripple File
Throughout the Java side of the application, environment properties are used. These are properties which correspond to certain settings, such as:

Addresses of data sources
Usernames and passwords for data sources
Specific endpoints to be used for queries
To find an example of this file, you can copy the a fully working example of one, which is located in the following directory:
ripple-demonstrator-api\src\main\resources\config\tomcat-context-example.xml

Copy the file to the root directory of the project. It is imperative that this context file is located here when on a development environment.

Rename the context file to:
context-ripple.xml

#### Command Line Execution

Open up a shell and navigate to the root directory of the project.
```
cd {projectRoot}
```

Use the following command to spin up an instance of a development server (the Java API code):

```
mvn clean package -Pwebapp:run
```

If you’re experiencing build errors, execute the following commands:

```
java --version
```
```
mvn --version
```

```
ruby --version
```
```
gem --version
```

If they do not return a suitable response, ensure that the system environment variables described above are pointing to the correct install directory, and that the \bin directories within them are on your PATH system environment variable.

Now that the server is running, open up a second shell and serve the web assets.

Firstly, change the current directory to the webapp package within the root directory of the project.
```
cd {projectRoot}\webapp
```
Serving the web assets will also watch for changes to the front end code, and re-serve those assets (used to facilitate speedy development of the UI).

These assets, and the features and themes enabled, are centred around a specific tenant.

In order to run the application using the standard Ripple tenant:
```
grunt serve
```

In order to run the application using a specific tenant:

```
grunt serve --tenant=ripple
```

#### IDE Configuration
NOTE: this needs more detail
If the application is to be ran from an IDE the following steps should be taken:

* Import the project by targeting the root POM.xml file  
* Create a debug maven configration
* Create a run maven configuration
