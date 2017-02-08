class rubrik::sla_domain::set (
  $rubriksla,
  ) inherits rubrik
{
  if $::sladomain != $rubriksla{
    notify{"Rubrik SLA Domain out of compliance ${::sladomain}, reapplying ${rubriksla}": }
    $script = 'rubrik.rb'
    $path = '/opt/puppetlabs/puppet/cache/lib/facter/ruby-bits/'
    $ruby = '/opt/puppetlabs/puppet/bin/ruby'
    $cmd =  "${ruby} ${path}${script} -c ${::hostname} -n ${rubrik::rubriknode} -u ${rubrik::rubrikuser} -p ${rubrik::rubrikpass} --sla --set --sladomain ${rubriksla}"
    exec { 'update-sla':
      command   => $cmd,
      cwd       => $path,
      logoutput => on_failure,
      provider  => shell,
    }
  }
  else{
    notify{"Rubrik SLA Domain Already set properly (${::sladomain})": }
  }
}
