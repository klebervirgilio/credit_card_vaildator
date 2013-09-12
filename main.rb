# Load required files
root_dir = File.dirname(__FILE__)
$:.unshift "#{root_dir}/lib", root_dir

Dir['./lib/*'].each{|f| require File.basename(f) }
require 'presenter'

# Greetings
puts "Let's play!"

# Say bye!
Signal.trap("INT") do
  puts "\nTerminating..."
  exit(0)
end

loop do
  print 'Enter with the Credit Card number: '
  input = STDIN.gets
  input.chomp!

  # Break the loop
   break(puts('bye bye...')) if input =~ /\A(?:q|quit|exit|bye)\z/i

  puts Presenter.new(input).present
end
