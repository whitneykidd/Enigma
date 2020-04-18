require_relative 'test_helper'
require './lib/cipher'


class CipherTest < Minitest::Test
  def setup
    Date.stubs(:today).returns(Date.new(1995, 8, 4))
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_can_create_a_character_set
    character_set = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']

    assert_equal character_set, @cipher.char_set
  end

  def test_it_can_return_todays_date
    assert_equal '040895', @cipher.date
  end

  def test_it_can_generate_key
    @cipher.stubs(:rand).returns('2715')
    assert_equal '02715', @cipher.generate_key
  end

  def test_it_can_square_date
    assert_equal 1672401025, @cipher.squared_date('040895')
  end

  def test_it_can_generate_offsets
    expected_offsets = {a: 1, b: 0, c: 2, d: 5}
    assert_equal expected_offsets, @cipher.generate_offsets('040895')
  end

  def test_it_can_separate_keys
    expected_keys = {a: 02, b: 27, c: 71, d: 15}
    assert_equal expected_keys, @cipher.separate_keys('02715')
  end

  def test_it_can_generate_shifts
    expected_shifts = {a: 3, b: 27, c: 73, d: 20}
    assert_equal expected_shifts, @cipher.generate_shifts('02715', '040895', 1)

    expected_shifts2 = {:a=>-3, :b=>-27, :c=>-73, :d=>-20}
    assert_equal expected_shifts2, @cipher.generate_shifts('02715', '040895', -1)
  end

  def test_it_can_shift_character_set
    shifts = {a: 3, b: 27, c: 73, d: 20}
    expected_set = ['u', 'v', 'w', 'x', 'y', 'z', ' ', 'a', 'b', 'c', 'd', 'e', 'f',
                    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't']
    assert_equal expected_set, @cipher.shift_char_set(3, shifts)


    expected_set2 = ['t', 'u', 'v', 'w', 'x', 'y', 'z', ' ', 'a', 'b', 'c', 'd', 'e',
                    'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's']
    assert_equal expected_set2, @cipher.shift_char_set(14, shifts)
  end

  def test_it_can_mutate_message
    shifts = {a: 3, b: 27, c: 73, d: 20}
    message = 'hello world'
    cipher_text = 'keder ohulw'
    assert_equal cipher_text, @cipher.mutate_message(message, shifts)

    message2 = 'HELLO WORLD!'
    cipher_text2 = 'keder ohulw!'
    assert_equal cipher_text2, @cipher.mutate_message(message2, shifts)
  end
end
