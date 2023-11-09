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
      # Check to see if the rubrik-agent package is installed.
      Facter::Core::Execution.execute("/bin/rpm --quiet -q rubrik-agent")
      $?.success?
    end 
  end
end
