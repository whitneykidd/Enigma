require './lib/cipher'

class Enigma < Cipher
  def encrypt(message, key, date)
    shifts = generate_shifts(key, date, 1)
    mutate_message(message, shifts)

    {encryption: mutate_message(message, shifts),
     key: key,
     date: date}
  end

  def decrypt(cipher_text, key, date)
    shifts = generate_shifts(key, date, -1)
    mutate_message(cipher_text, shifts)

    {decryption: mutate_message(cipher_text, shifts),
     key: key,
     date: date}
  end
end
