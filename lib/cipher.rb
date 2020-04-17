require 'date'
class Cipher
  attr_reader :char_set, :date
  def initialize
    @char_set = ('a'..'z').to_a << ' '
    @date = Date.today.strftime('%d%m%y')
  end
end
