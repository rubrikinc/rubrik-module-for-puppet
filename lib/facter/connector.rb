Facter.add(:rubrik_connector) do
  setcode do
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      status = (system( "powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") )
      if status.chomp == "Running"
        true
      else
        false
      end
    end
  end
end
