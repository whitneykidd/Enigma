require './lib/cipher'

class Enigma < Cipher
  def generate_key
    rand(99999).to_s.rjust(5, '0')
  end
end
