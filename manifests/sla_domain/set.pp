class rubrik::sla_domain::set (
  $rubriksla,
  ) inherits rubrik
{
  if $::sladomain != $rubriksla{
    notify{"Rubrik SLA Domain out of compliance ${::sladomain}, reapplying ${rubrik::rubrikpass}": }
    $script = '/opt/puppetlabs/puppet/cache/lib/facter/ruby-bits/rubrik.rb'
    $ruby = '/opt/puppetlabs/puppet/bin/ruby'
    $cmd =  "${ruby} ${script} -c ${::hostname} -n ${rubrik::rubriknode} -u ${rubrik::rubrikuser} -p ${rubrik::rubrikpass} --sla --set --sladomain ${rubriksla}"
    notify{"Running ${cmd}":}
    exec { 'update-sla':
      command => $cmd,
    }
  }
  else{
    notify{"Rubrik SLA Domain Already set properly ${rubrik::rubrikpass}": }
  }
}
