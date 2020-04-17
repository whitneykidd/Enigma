require './lib/cipher'

class Enigma < Cipher
  def generate_key
    rand(99999).to_s.rjust(5, '0')
  end

  def squared_date(date)
    date.to_i ** 2
  end

  def generate_offsets(date)
    offset = squared_date(date).to_s[-4..-1]
    offset_shifts = {a: offset[0], b: offset[1], c: offset[2], d: offset[3]}
    offset_shifts.transform_values(&:to_i)
  end
end
