Facter.add(:rubrik_connector_installed) do
  setcode do
    rubrik_connector_installed = ""
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      rubrik_connector = '(Get-Service "Rubrik Backup Service").status' 
    end
  end
end
