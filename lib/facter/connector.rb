Facter.add(:rubrik_connector) do
  setcode do
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      status = (system( "powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") )
      if status == "Running"
        return 'Installed'
      end
    end
  end
end
