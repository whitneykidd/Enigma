require './lib/enigma'

 abort("ERROR: wrong number of arguments (expected 4, received #{ARGV.length})") if ARGV.length != 4
 abort('ERROR: first arg must be .txt file') if ARGV[0][-4..-1] != '.txt'
 abort('ERROR: second arg must be .txt file') if ARGV[1][-4..-1] != '.txt'

 file = File.open(ARGV[0], 'r')
 cipher_text = ""
 file.each { |line| cipher_text << line }

 enigma = Enigma.new
 decrypted_message = enigma.decrypt(cipher_text, ARGV[2], ARGV[3])

 File.open(ARGV[1], 'w') { |file| file.write(decrypted_message[:decryption]) }
 p "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
