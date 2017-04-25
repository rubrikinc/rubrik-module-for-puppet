class rubrik::sla_domain::set (
  $rubriksla,
  ) inherits rubrik
{
  if $::sladomain != $rubriksla{
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
