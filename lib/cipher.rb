require 'date'
class Cipher
  attr_reader :char_set, :date
  def initialize
    @char_set = ('a'..'z').to_a << ' '
    @date = Date.today.strftime('%d%m%y')
  end

  def generate_key
    rand(99999).to_s.rjust(5, '0')
  end

  def squared_date(date)
    date.to_i ** 2
  end
end
