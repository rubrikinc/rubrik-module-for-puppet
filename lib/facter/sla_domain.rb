require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ]
  puts "We are looking for the facts!"
  setcode do
    answer = "here"
  end
end
