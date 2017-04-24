Facter.add(:rubrik_connector) do
  setcode do
    rubrik_connector= ""
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      status = system( "powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") 
      if status == "Running"
        rubrik_connector = "Installed"
      end
    end
  end
end
