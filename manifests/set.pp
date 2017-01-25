class sla_domain::set
(
String $sla_domain                    = $::set)
{
  notify{"rubrik module set ${sla_domain}":}
}
