# rubrik

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with rubrik](#setup)
    * [What rubrik affects](#what-rubrik-affects)
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
  :git  =>  'https://github.com/pmilano1/rubrik'
```
### What rubrik affects

This module currently enforces SLA Domain membership

## Usage

### Define classes to load in base - Depends on hiera_include('classes')

```ruby
classes:
    - rubrik::sla_domain::set
```
### Hiera - Let's set a base sladomain

```ruby
rubrik::sla_domain::set::sla_domain: 'Silver'
```

## Reference

## Limitations

* Rubrik v3.1

* Centos7

* Puppet 2016/05

## Development


## Release Notes/Contributors/Etc.
