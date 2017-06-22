# ucsm_dockerdc
Deployment module for Cisco UCS Manager with Docker Datacenter

#### Table of Contents

1. [Description](#description)
1. [Installation - The basics of getting started with ucsm_dockerdc](#installation)
    * [What ucsm_dockerdc affects](#what-ucsm_dockerdc-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ucsm_dockerdc](#beginning-with-ucsm_dockerdc)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Development - Guide for contributing to the module](#development)
1. [Todos - Additional work to complete](#todos)

## Description
ucsm and ucsm_dockerdc Puppet modules can be used with physical UCSM domains on with the UCS Platform Emulator.  Please see https://communities.cisco.com/docs/DOC-74434 for additional information on the Puppet modules for UCS Manager and a hands on lab guide that can be used in the Cisco demo Cloud (dcloud.cisco.com).

## Installation

1.  Clone the ucsm puppet module into your puppet modules directory.  The modules directory location may vary depending on how puppet is installed.
    ```
    cd /etc/puppetlabs/code/environments/production/modules
    git clone https://github.com/CiscoUcs/puppet-ucsm ucsm
    ```

2.  Clone the ucsm Docker DC puppet module into your puppet modules directory.  The modules directory location may vary depending on how puppet is installed.
    ```
    cd /etc/puppetlabs/code/environments/production/modules
    git clone https://github.com/CiscoUcs/puppet-ucsm_dockerdc.git ucsm_dockerdc
    ```

### What ucsm_dockerdc affects

* Dependencies that ucsm_dockerdc requires.

ucsm_dockerdc depends on the ucsm puppet module.

The ucsm puppet module depends on the UCS Manager Python SDK.  If the UCSM Python SDK is not installed, please see https://github.com/CiscoUcs/ucsmsdk for installation instructions.

### Setup Requirements

##### Puppet Master Installation and Configuration

A VM running CentOS 7 was chosen to serve as puppet master. On this VM, Puppet Enterprise was installed.

Steps to install Puppet Enterprise on vm/node are as follows.

1. Go to [Puppet Enterprise Product Page](https://puppet.com/download-puppet-enterprise). Sign up and download Puppet Enterprise installer package for your VM/node.

2. After download is complete, run the installer inside the package and follow through the prompts asked during installation.

3. If install is successful, check the status of all pe-puppet services are "active" before proceeding further.  Use the following command to check the status of pe-puppet services.
    ```
    systemctl status pe-puppet*
    ```

4. Set firewall rules to allow the following ports.
    ```
    sudo su
    ufw status
    ufw enable
    ufw allow 22
    ufw allow 8140
    ufw allow 4433
    ufw allow 8143
    ufw allow 8140
    ufw allow 8081
    ufw allow 4433
    ufw status
    ```
    
## Usage

Manifests for ucsm_dockerdc are strucuted to include a site manifest “site.pp”, a roles file “roles.pp”, and a profiles file “profile.pp”.  The roles.pp manifests defines the Cisco UCS Service Profile Templates used in this design, and profile.pp is used to configure UCSM pools and policies used by the Service Profile Templates.

The ucsm_dockerdc setup employs a puppet master and agent/API proxy architecture.  Cisco UCS Manager does not run a puppet agent, so an existing puppet agent under puppet management is designated as an API proxy to communicate with UCS Manager.

# API proxy node setup through Hiera

1. Create a hiera file with same name as the certificate signed by the API proxy node.  The hiera file must be placed in the hiera lookup path (e.g., /etc/puppetlabs/code/environments/production/hieradata/nodes/<node cert name>.yaml).

2. Add the node definition of the API proxy node "/etc/puppetlabs/code/environments/production/manifests/site.pp".

Case 1: Suppose the API certname is "razor".  Add the following lines in site.pp file.
    ```
        ...
           node "razor"{
             include ucsm_dockerdc::profile::ucsm_config
           }
        ...
    ```

Details of the hieradata which goes in "/etc/puppetlabs/code/environments/production/hieradata/nodes/<certname of node>.yaml" is documented in the CVD Design Document.

Note that "puppet apply", when combined with scheduling and an automated system for pushing manifests, can be used to implement a serverless puppet site.  Example puppet apply commandlines for serverless puppet management:

* puppet apply -e "include ucsm_dockerdc::bios_policy"

Node definitions and external node classifiers (Puppet Enterprise Console) can co-exist.  Puppet merges their data as follows:

Variables from an ENC are set at top scope and can thus be overridden by variables in a node definition.
Classes from an ENC are declared at node scope, which means they will be affected by any variables set in the node definition.
Although ENCs and node definitions can work together, we recommend that most users pick one or the other.

## Development

## Todos

* Support vNIC template modifications (e.g., adding/removing vlans)
