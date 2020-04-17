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
end
