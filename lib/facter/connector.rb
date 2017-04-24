Facter.add(:rubrik_connector) do
  setcode do
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
       if (system( "powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status")) == "Running"
         true
       else
         false
      end
    end
  end
end
