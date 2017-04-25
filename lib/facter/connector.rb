Facter.add(:rubrik_connector) do
  setcode do
    $conn_status = ''
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
       conn_status = Facter::Util::Resolution::exec("powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") 
       if conn_status == "Running" then
         conn_status
       else
         conn_status
      end
    end
  end
end
