class rubrik::sla_domain::set( $sla_domain = 'Undefined')
{
  if ::sladomain != $sla_domain{
    notify{"Rubrik SLA Domain out of compliance, reapplying ${sla_domain}": }
  }
  else{
    notify{'Rubrik SLA Domain Already set properly': }
  }
}
