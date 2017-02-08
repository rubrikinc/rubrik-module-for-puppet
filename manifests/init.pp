class rubrik($rubriknode,$rubrikpass,$rubrikuser){
  file { '~/.rubrik':
    ensure => directory,
  }
  file { '~/.rubrik/creds.json':
    ensure  => file,
    mode    => '0600',
    content => template('rubrik/creds_json.erb'),
    }
}
