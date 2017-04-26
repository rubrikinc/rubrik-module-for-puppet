# Class installs connector on linux and windows kernels, just include it in the manifest/hiera 
# where it suits your installation

class rubrik::connector ( ) inherits rubrik {
  case $::kernel {
    /(W|w)indows/: {
      if str2bool($::rubrik_connector) == false {
        download_file { 'Rubrik Agent Download' :
          url                   => "https://${rubrik::rubriknode}/connector/RubrikBackupService.zip",
          destination_directory => $::rubrik_temp_dir,
          insecure              => true,
        }
        -> windows::unzip { "${::rubrik_temp_dir}/RubrikBackupService.zip":
          destination => $::rubrik_temp_dir,
          unless      => '$rubrik_temp_dir\RubrikBackupService.msi',
        }
        -> package { 'Rubrik Backup Service':
          ensure => installed,
          source => "${::rubrik_temp_dir}/RubrikBackupService.msi",
        }
      }
    }
    /(L|l)inux/: {
      if str2bool($::rubrik_connector) == false {
        include wget
        wget::fetch { "https://${rubrik::rubriknode}/connector/rubrik-agent.x86_64.rpm":
          destination        => '/tmp/',
          timeout            => 0,
          verbose            => true,
          nocheckcertificate => true
        }
        -> package { 'rubrik-agent':
          ensure   => installed,
          provider => 'rpm',
          source   => '/tmp/rubrik-agent.x86_64.rpm'
        }
      }
    }
    default: {
      fail("Module ${module_name} has no current value on ${::operatingsystem}")
    }
  }
}
