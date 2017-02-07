# rubrik

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with rubrik](#setup)
    * [What rubrik affects](#what-rubrik-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rubrik](#beginning-with-rubrik)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The Rubrik Puppet Module supplies an interface into the Rubrik (Brik)
configuration as it pertains to puppet agents.

## Setup

mod 'rubrik',
  :git  =>  'https://github.com/pmilano1/rubrik'

### What rubrik affects **OPTIONAL**

This module currently enforces SLA Domain membership

### Setup Requirements **OPTIONAL**

Tested on Rubrik v3.1

### Beginning with rubrik

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

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

Rubrik v3.1

Centos7

Puppet 2016/05

## Development


## Release Notes/Contributors/Etc. **Optional**
