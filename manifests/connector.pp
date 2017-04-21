class rubrik::connector ( ) inherits rubrik {
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
