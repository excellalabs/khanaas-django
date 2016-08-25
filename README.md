# KHAN as a service, in Django

This is an introductory tutorial for learning core Django concepts.  You will be replicating the functionality of www.khanaas.com, plus additional features to showcase Django strengths such as the ORM and Forms.

## The Tutorial

For step-by-step instructions for creating your own KhanAAS app, continue to the [wiki](https://github.com/excellalabs/khanaas-django/wiki)

## About KhanAAS

  - **Technology stack**: 
   - Python 2.7
   - Django 1.8
   - Postgres 9.3

Rather than providing complex instructions for installing these tools, we'll be utilizing Vagrant to easily create a Linux virtual machine that is preconfigured for Django development.

**NOTE**: Installing the dependencies and the khanaas-django virtual environment will consume about 1GB of bandwidth.

## Dependencies
- **Vagrant / Virtualbox** - creates the VM used for development
  - Vagrant download links can be found [here](http://www.vagrantup.com/downloads)
  - Virtualbox download links can be found [here](https://www.virtualbox.org/wiki/Download_Old_Builds_4_3)
    - We had issues getting the recently released Virtualbox 5.0 working with the Ubuntu virtual image used in this workshop.
    - The link above is for the 4.3 version of Virtualbox, which is still being maintained.
  - Git - You'll need [git](http://git-scm.com/downloads) to clone this repository.
  
## Windows Dependencies
- Windows users may need to install SSH software to get Vagrant working
  - Cygwin should work fine with Vagrant
  - Another easy way to enable SSH is to download [Git](http://git-scm.com/download/win) and:
    1. Use the `Git Bash` application to run Vagrant commands OR
    2. Manually set the PATH in cmd.exe before running vagrant: `set PATH=%PATH%;C:\Program Files (x86)\Git\bin`

## Installation
1. Clone this repository `git clone https://github.com/excellalabs/khanaas-django.git`
1. Open your terminal/command line tool of choice and navigate to the `khanaas-django` directory you just created
 - Windows users, make sure to use a terminal that has an SSH client (see Windows Dependencies above)
1. Run `vagrant up` to create the virtual machine
 - NOTE: This requires about 700MB of bandwidth
 - This will load a lightweight Ubuntu Linux virtual machine with no GUI.  We will interact with it via command line actions.
 - This step will also install Django, PostgreSQL, and other requirements
 - Windows users, if you get prompted with a firewall warning, make sure you allow 'private network' access


Coming Soon: A guide for creating your own Khan AAS app

### Command Line Access
Once provisioning completes, connect to the machine using `vagrant ssh`

### Starting / Stopping the VM
To start the vagrant box: `vagrant up`  
To stop the vagrant box: `vagrant halt`  
