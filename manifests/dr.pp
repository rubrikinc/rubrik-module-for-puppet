class rubrik::dr($rubrikDR_IP,$rubrikDR_GW) inherits rubrik{
  file { '/root/rubrikDR.sh':
    ensure  => file,
    mode    => '0400',
    content => template('rubrik/rubrikDR.erb'),
    }
}



