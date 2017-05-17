# rubrik

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with rubrik](#setup)
    * [What rubrik-puppet affects](#what-rubrik-affects)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The Rubrik Puppet Module supplies an interface into the Rubrik (Brik)
configuration as it pertains to puppet agents.

## Setup
Add the module to your Puppetfile
```ruby
mod 'rubrik',
  :git  =>  'https://github.com/rubrik-devops/rubrik-puppet'
```
### Dependencies
These modules are required :
```ruby
mod 'maestrodev-wget', '1.7.3'
mod 'puppet-download_file',
  :git  =>  'git@github.com:rubrik-devops/puppet-download_file.git'
mod 'counsyl-windows', '1.0.4'
mod 'puppet_gem'
```
You will also need to include faraday in your puppet ruby gems
```   
package { 'rubygems':
  ensure => present,
}
package { 'faraday':
  provider => 'puppet_gem',
  require  => Package['rubygems'],
}
```
### What rubrik affects

This module currently enforces SLA Domain membership and installation of connectors for linux and windows kernels. 

## Usage

### Define classes to load in base - Depends on hiera_include('classes')

```ruby
classes:
    - rubrik
    - rubrik::sla_domain::set
    - rubrik::connector
```
### Hiera - Let's set a base sladomain

```ruby
rubrik::sla_domain::set: '[your desired rubrik sla domain name]'
rubrik::rubriknode: '[your rubrik node fqdn or ip]'
rubrik::rubrikuser: '[your rubrik user name]'
rubrik::rubrikpass: 'eyaml[your rubrik password]'
```

## Reference
This module will allow facter to interact with the Agent configuration with regard to SLA Domains. It will also allow the Agent to self correct based on the configured SLA Domain in your hiera hierarchy. It will also allow installation of the connector.

## Tested On

* Rubrik v3.1

* Centos7

* Puppet 2016/05

## Development

* Use cases surrounding Disaster Recover Initiatives

## Release Notes/Contributors/Etc.
