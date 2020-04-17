require './lib/cipher'

class Enigma < Cipher
  def generate_key
    rand(99999).to_s.rjust(5, '0')
  end

  def squared_date(date)
    date.to_i ** 2
  end

  def date_offset(date)
    squared_date(date).to_s[-4 ..-1].to_i
  end

  def generate_offsets(date)
    offsets = {a: date_offset(date)[0]}
  end
end
