Facter.add(:rubrik_connector) do
  setcode do
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
       (system( "powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") )
    end
  end
end
