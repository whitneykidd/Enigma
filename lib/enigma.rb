require './lib/cipher'

class Enigma < Cipher
  def encrypt(message, key = generate_key, date = @date)
    shifts = generate_shifts(key, date, 1)

    {encryption: mutate_message(message, shifts),
     key: key,
     date: date}
  end

  def decrypt(cipher_text, key, date)
    shifts = generate_shifts(key, date, -1)

    {decryption: mutate_message(cipher_text, shifts),
     key: key,
     date: date}
  end
end
