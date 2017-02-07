class rubrik::sla_domain::set( $myvar = $::sla_domain)
{
  notify{"In Rubrik Set Routine for ${::hostname}, I have ${::sla_domain} but it should be ${::sladomain}":}
}
