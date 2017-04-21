class rubrik::connector ( ) inherits rubrik {
  case $operatingsystem {
    windows: {



# unzip the Download
    archive { '/var/lib/example.zip':
      extract       => true,
      extract_path  => '/opt',
      extract_flags => '-of',
      cleanup       => true,
    } ->

    package { 'rubrik-agent':
      ensure => installed,
      provider => 'msi',
      source => "https://${rubrik::rubriknode}/connector/RubrikBackupService.zip",
    }
  }
}
  case $kernel {
    linux: {
      if ! defined(Package['rubrik-agent']) {
        include wget
        wget::fetch { "https://${rubrik::rubriknode}/connector/rubrik-agent.x86_64.rpm":
          destination => '/tmp/',
          timeout     => 0,
          verbose     => true,
          nocheckcertificate     => true
        } -> 
      
        package { 'rubrik-agent':
          provider => 'rpm',
          ensure => installed,
          source => "/tmp/rubrik-agent.x86_64.rpm"
        }
      }
    }  
  }
}
