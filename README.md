ruby-bits
===============

Generic ruby bits to be organized and used in chef/puppet environments

#Overview:
* rubrik.rb is the start of the framework to run underneath puppet/chef
---
#How to use:
* ~/.rubrik/creds.json must be in place in order to use any of the underlying code
```json
{
    "server": "[FQDN/IP of appliance]",
    "username": "[username]",
    "password": "[password]"
}
```
* rubrikSetSla.rb 
```
  Use this in order to confirm/change Rubrik SLA Domain for a vm_name.

  The script will confirm current subscription, if it exists, and act accordingly
  		 If SLA Domain is already set to desired name:
  			 * Rubrik SLA Domain already set properly
  		 If SLA Domain does not exist:
  			 * Rubrik SLA Domain not set properly
  			 * Rubrik SLA Domain does NOT exist, cannot comply
  		 If SLA Domain exists and is VM is reassigned
  			 * Rubrik SLA Domain not set properly
  			 * Rubrik SLA Domain Exists, setting vm_name to use it
  			 * Rubrik SLA Domain Set to sla_name
  	Usage : rubrikSetSla [vm_name] [sla_name]
```
---
#Use Cases:
* Rubrik SLA Policies by Role
* Submit new use cases please
---
#Thanks to:
