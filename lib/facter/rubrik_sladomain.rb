require 'facter'
Facter.add(:rubrik_sladomain) do
  hn = Facter.value(:hostname)
  setcode do
  ruby = '/opt/puppetlabs/puppet/bin/ruby'
  cmd = File.join(File.dirname(__FILE__), 'ruby-bits/rubrik.rb')
  run = "#{ruby} #{cmd} -c #{hn} --sla --get" # This will be dynamic either by vm name and/or IP
  Facter::Util::Resolution.exec(run)
  end
end
