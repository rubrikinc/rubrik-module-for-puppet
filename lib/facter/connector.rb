Facter.add(:rubrik_connector) do
  setcode do
    rubrik_connector= ""
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      rubrik_connector = system("powershell (Get-Service "Rubrik Backup Service").status") 
    end
  end
end
