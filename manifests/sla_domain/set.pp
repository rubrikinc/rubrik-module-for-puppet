class rubrik::sla_domain::set (
  $rubriksla,
  ) inherits rubrik
{
  notify{"Running SLA Domain Check"}
  if $::sladomain != $rubriksla{
    notify{"Rubrik SLA Domain out of compliance ${::sladomain}, reapplying ${rubriksla}":
      loglevel => info,
    }
    $script = 'rubrik.rb'
    $path = '/opt/puppetlabs/puppet/cache/lib/facter/ruby-bits/'
    $ruby = '/opt/puppetlabs/puppet/bin/ruby'
    $cmd =  "${ruby} ${path}${script} \
     -c ${::hostname} \
     -n ${rubrik::rubriknode} \
     -u ${rubrik::rubrikuser} \
     -p ${rubrik::rubrikpass} \
     --sla --assure ${rubriksla}"
    exec { 'update-sla':
      command   => $cmd,
      cwd       => $path,
      logoutput => on_failure,
      provider  => shell,
    }
  }
}
