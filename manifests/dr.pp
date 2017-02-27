class rubrik::dr($rubrikDR_IP,$rubrikDR_GW) inherits rubrik{
  file { '/root/rubrikDR.sh':
    ensure  => file,
    mode    => '0500',
    content => template('rubrik/rubrikDR.erb'),
    }
  file { "/etc/cron.d/rubrikDR":
    content => "@reboot root /root/rubrikDR.sh \n",
    }
}



