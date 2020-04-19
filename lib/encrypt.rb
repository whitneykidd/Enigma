require './lib/enigma'

 abort("ERROR: wrong number of arguments (expected 2, received #{ARGV.length})") if ARGV.length != 2
 abort('ERROR: first arg must be .txt file') if ARGV[0][-4..-1] != '.txt'
 abort('ERROR: second arg must be .txt file') if ARGV[1][-4..-1] != '.txt'

 file = File.open(ARGV[0], 'r')
 message = " "
 file.each { |line| message << line }

 enigma = Enigma.new
 encrypted_message = enigma.encrypt(message)

 encrypted_text = File.open(ARGV[1], 'w') { |file| file.write(encrypted_message[:encryption]) }
 p "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
