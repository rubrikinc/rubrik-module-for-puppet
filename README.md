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
### What rubrik affects

This module currently enforces SLA Domain membership

## Usage

### Define classes to load in base - Depends on hiera_include('classes')

```ruby
classes:
    - rubrik
    - rubrik::sla_domain::set
```
### Hiera - Let's set a base sladomain

```ruby
rubrik::sla_domain::set::sla_domain: '[your desired rubrik sla domain name]'
rubrik::rubriknode: '[your rubrik node fqdn or ip]'
rubrik::rubrikuser: '[your rubrik user name]'
rubrik::rubrikpass: 'eyaml[your rubrik password]'
```

## Reference
This module will allow facter to interact with the Agent configuration with regard to SLA Domains. It will also allow the Agent to self correct based on the configured SLA Domain in your hiera hierarchy.

## Tested On

* Rubrik v3.1

* Centos7

* Puppet 2016/05

## Development

* Use cases surrounding Disaster Recover Initiatives

## Release Notes/Contributors/Etc.
