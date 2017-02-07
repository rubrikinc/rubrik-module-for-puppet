class rubrik::sla_domain::set(
  $rubriksla,
  $rubriknode,
  $rubrikpass,
  $rubrikuser,
  )
{
  if ::sla_domain != $rubriksla{
    notify{"${::rubrik::configs::rubriksla} Rubrik SLA Domain out of compliance ${::sla_domain}, reapplying ${rubriksla}": }
    $script = '/opt/puppetlabs/puppet/cache/lib/facter/ruby-bits/rubrikSetSla.rb'
    $ruby = '/opt/puppetlabs/puppet/bin/ruby'
    $cmd =  "${ruby} ${script} ${::hostname} ${rubriksla}"
    notify{"Running ${cmd}":}
#    exec { 'update-sla':
#      command => "${ruby} ${script} ${::hostname} ${rubriksla}",
#    }
  }
  else{
    notify{'Rubrik SLA Domain Already set properly': }
  }
}
