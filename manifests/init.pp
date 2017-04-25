# Main rubrik class, right now just puts creds on linux so that facter can grab SLA

class rubrik($rubriknode,$rubrikpass,$rubrikuser){
  case $::kernel {
    /(L|l)inux/: {
      file { '/root/.rubrik':
        ensure => directory,
      }
      file { '/root/.rubrik/creds.json':
        ensure  => file,
        mode    => '0400',
        content => template('rubrik/creds_json.erb'),
      }
    }
    default: {
      notify("Module ${module_name} has no current value on ${::operatingsystem}")
    }
  }
}
