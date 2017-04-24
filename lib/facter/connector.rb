Facter.add(:rubrik_connector) do
  setcode do
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
       if Facter::Util::Resolution:exec("(Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue).status") == "Running" then
         true
       else
         false
      end
    end
  end
end
