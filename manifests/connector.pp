class rubrik::connector ( ) inherits rubrik {
  case $kernel {
    linux: {
      package { 'package':
        provider => 'rpm',
        ensure => installed,
        source => "${connector::rpm}"
      }
    }  
  }
}
class { 'connector':
  src => 'https://${rubrik::rubriknode}/connector/rubrik-agent.x86_64.rpm',
}
