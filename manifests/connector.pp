class rubrik::connector ( ) inherits rubrik {
  case $kernel {
    linux: {

      package { 'package':
        provider => 'rpm',
        ensure => installed,
        source => "/tmp/rubrik-agent.x86_64.rpm"
      }
      include wget
      wget::fetch { "https://${rubrik::rubriknode}/connector/rubrik-agent.x86_64.rpm":
        destination => '/tmp/',
        timeout     => 0,
        verbose     => false,
        nocheckcertificate     => true
      }  
      
    }  
  }
}
