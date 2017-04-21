class rubrik::connector ( ) inherits rubrik {
  case $operatingsystem {
    windows: {
      download_file { "Download dotnet 4.0" :
        url   => "https://${rubrik::rubriknode}/connector/RubrikBackupService.zip",
        destination_directory => ::$rubrik_temp_dir
      } ->
      archive { "::$rubrik_temp_dir/RubrikBackupService.zip":
        extract       => true,
        extract_path  => ::$rubrik_temp_dir,
        extract_flags => '-of',
        cleanup       => true,
      } ->

      package { 'rubrik-agent':
        ensure   => installed,
        provider => 'msi',
        source   => "https://${rubrik::rubriknode}/connector/RubrikBackupService.zip",
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
          ensure   => installed,
          source   => "/tmp/rubrik-agent.x86_64.rpm"
        }
      }
    }  
  }
}
