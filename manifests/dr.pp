class rubrik::dr($rubrikDR_IP,$rubrikDR_GW,$rubrikDR_REALM,$rubrikDR_KDC) inherits rubrik{
  package {'krb5-workstation':
    ensure => 'installed',
    }
  file { '/root/rubrikDR.sh':
    ensure  => file,
    mode    => '0500',
    content => template('rubrik/rubrikDR.erb'),
    }
  file { '/etc/krb5.conf':
    ensure  => file,
    mode    => '0644',
    content => template('rubrik/krb5.erb'),
    }
  file { "/etc/cron.d/rubrikDR":
    content => "@reboot root kinit $rubrikDR_USER@$rubrikDR_REALM -k -t /root/root.keytab; /root/rubrikDR.sh \n",
    }
  file { "/root/root.keytab":
    mode => "0400",
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/rubrik/root.keytab',
    }
}



