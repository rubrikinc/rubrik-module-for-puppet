Facter.add(:rubrik_connector) do
  setcode do
    rubrik_connector= ""
    case Facter.value(:kernel) 
    when 'windows' || 'Windows'
      begin
        status = system( "powershell (Get-Service 'Rubrik Backup Service' -ErrorAction SilentlyContinue)") 
        if status == true
          rubrik_connector="Installed"
        else 
          rubrik_connector=""
        end
      rescue
        rubrik_connector=""
      end
    end
  end
end
