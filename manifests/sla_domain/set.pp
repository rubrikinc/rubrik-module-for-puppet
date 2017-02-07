class rubrik::sla_domain::set(
  $slahash = {}
  )
{
  validate_hash ( $slahash )
  $configs = hiera_hash('rubrik::configs', $slahash)
  if ::sladomain != $rubriksla{
    notify{"${::rubrik::configs::rubriksla} Rubrik SLA Domain out of compliance, reapplying ${rubrikuser} ${rubriksla}": }
    $script = '/opt/puppetlabs/puppet/cache/lib/facter/ruby-bits/rubrikSetSla.rb'
    $ruby = '/opt/puppetlabs/puppet/bin/ruby'
    $cmd =  "${ruby} ${script} ${::hostname} ${rubriksla}"
    notify{"Running ${cmd}":}
    exec { 'update-sla':
      command => "${ruby} ${script} ${::hostname} ${rubriksla}",
    }
  }
  else{
    notify{'Rubrik SLA Domain Already set properly': }
    set_sla{$rubriksla:}
  }
}
