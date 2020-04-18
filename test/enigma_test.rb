require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_can_encrypt_message
    message = 'hello world'
    key = "02715"
    date = "040895"

    expected = {
            encryption: 'keder ohulw',
            key: "02715",
            date: "040895"
              }
    assert_equal expected, @enigma.encrypt(message, key, date)
  end

  def test_it_can_decrypt_message
    cipher_text = 'keder ohulw'
    key = "02715"
    date = "040895"

    expected = {
            decryption: 'hello world',
            key: "02715",
            date: "040895"
              }
    assert_equal expected, @enigma.decrypt(cipher_text, key, date)
  end
end
