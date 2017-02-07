class rubrik::sla_domain::set( $sla_domain = 'Undefined')
{
  notify{"In Rubrik Set Routine for ${::hostname}, I have %{::sladomain} but it should be ${sla_domain}":}
}
