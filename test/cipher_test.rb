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
end
