class rubrik($rubriknode,$rubrikpass,$rubrikuser){
  file { '/root/.rubrik':
    ensure => directory,
  }
  file { '/root/.rubrik/creds.json':
    ensure  => file,
    mode    => '0600',
    content => template('rubrik/creds_json.erb'),
    }
}
