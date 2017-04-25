Facter.add(:rubrik_connector) do
  setcode do
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      conn_status = Facter::Util::Resolution::exec("powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") 
      if conn_status == "Running" then
        'true'
      else
        'false'
      end
    when 'linux' || 'Linux'
      Facter::Util::Resolution::exec("/bin/rpm -q -a | grep rubrik-agent | wc -l")
    end 
  end
end
