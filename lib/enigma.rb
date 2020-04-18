require './lib/cipher'

class Enigma < Cipher
  def encrypt(message, key, date)
    shifts = generate_shifts(key, date, 1)
    mutate_message(message, shifts)
  end

  def decrypt(cipher_text, key, date)
    shifts = generate_shifts(key, date, -1)
    mutate_message(cipher_text, shifts)
  end
end
