class rubrik($rubriknode,$rubrikpass,$rubrikuser){
  file { '/root/.rubrik':
    ensure => directory,
  }
  file { '/root/.rubrik/creds.json':
    ensure  => file,
    mode    => '0400',
    content => template('rubrik/creds_json.erb'),
    }
  file { '/root/rubrikDR.sh':
    ensure  => file,
    mode    => '0400',
    content => template('rubrik/rubrikDR.erb'),
    }
}
