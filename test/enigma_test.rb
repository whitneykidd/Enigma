require_relative 'test_helper'
require './lib/enigma'


class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_generate_key
    @enigma.stubs(:rand).returns('2715')
    assert_equal '02715', @enigma.generate_key
  end

  def test_it_can_square_date
    assert_equal 1672401025, @enigma.squared_date('040895')
  end

  def test_it_can_generate_offsets
    expected_offsets = {a: 1, b: 0, c: 2, d: 5}
    assert_equal expected_offsets, @enigma.generate_offsets('040895')
  end

  def test_it_can_separate_keys
    expected_keys = {a: 02, b: 27, c: 71, d: 15}
    assert_equal expected_keys, @enigma.separate_keys('02715')
  end

  def test_it_can_generate_shifts
    expected_shifts = {a: 3, b: 27, c: 73, d: 20}
    assert_equal expected_shifts, @enigma.generate_shifts('02715', '040895')
  end

  def test_it_can_shift_character_set
    expected_set = ['d', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
                    'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ', 'a', 'b', 'c']
    assert_equal expected_set, @enigma.shift_char_set(3)

    expected_set2 = ['s', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ', 'a', 'b', 'c', 'd', 'e',
                    'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r']
    assert_equal expected_set2, @enigma.shift_char_set(18)

  end
end
