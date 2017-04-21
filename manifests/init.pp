class rubrik($rubriknode,$rubrikpass,$rubrikuser){
  case $kernel {
    linux: {
      file { '/root/.rubrik':
        ensure => directory,
      }
      file { '/root/.rubrik/creds.json':
        ensure  => file,
        mode    => '0400',
        content => template('rubrik/creds_json.erb'),
      }
    }
  }
}
