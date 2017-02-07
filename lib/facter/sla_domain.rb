require 'facter'
Facter.add(:sladomain) do
  hn = Facter.value(:hostname)
  setcode do
  ruby = '/opt/puppetlabs/puppet/bin/ruby'
  cmd = File.join(File.dirname(__FILE__), 'ruby-bits/rubrikGetSla.rb')
  run = "#{ruby} #{cmd} #{hn}" # This will be dynamic either by vm name and/or IP
  Facter::Util::Resolution.exec(run)
  end
end
