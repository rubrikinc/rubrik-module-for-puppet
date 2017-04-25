Facter.add(:rubrik_connector) do
  setcode do
    mykernel = Facter.value(:kernel) 
    case mykernel
    when /(W|w)indows/ 
      conn_status = Facter::Util::Resolution::exec("powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") 
      if conn_status == "Running" then
        'true'
      else
        'false'
      end
    when /(L|l)inux/ 
      'running linux'
      conn_status = Facter::Util::Resolution::exec("/bin/rpm -q -a | grep telnet | wc -l")
      if conn_status then
        'true'
      else
        'false'
      end
    end 
  end
end
