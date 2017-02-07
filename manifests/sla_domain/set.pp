class rubrik::sla_domain::set( $sla_domain = 'Undefined')
{
  if ::sladomain != $sla_domain{
    notify{"Rubrik SLA Domain out of compliance, reapplying ${sla_domain}": }
    if ::osfamily == 'linux' {
      $script = '/opt/puppetlabs/puppet/cache/lib/facter/rub-bits/rubrikSetSla.rb'
      $ruby = '/opt/puppetlabs/puppet/bin/ruby'
      exec { 'update-sla':
        command => "${ruby} ${script} ${::hostname} ${sla_domain}",
        }
      }
  }
  else{
    notify{'Rubrik SLA Domain Already set properly': }
    set_sla{$sla_domain:}
  }
}
