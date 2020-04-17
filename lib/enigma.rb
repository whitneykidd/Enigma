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

  def separate_keys(key)
    keys = {a: key[0..1], b: key[1..2], c: key[2..3], d: key[3..4]}
    keys.transform_values(&:to_i)
  end

  def generate_shifts(key, date)
    offsets = generate_offsets(date)
    separate_keys(key).merge(offsets) do |_, key, offset|
      (key + offset)
    end
  end

  def shift_char_set(index, shifts)
    return @char_set.rotate(shifts[:a]) if index % 4 == 0
    return @char_set.rotate(shifts[:b]) if index % 4 == 1
    return @char_set.rotate(shifts[:c]) if index % 4 == 2
    return @char_set.rotate(shifts[:d]) if index % 4 == 3
  end

  def mutate_message(message, shifts)
    mutated = ""
    message.downcase.each_char.with_index do |char, index|
      if @char_set.include?(char)
        mutated += shift_char_set(index, shifts)[@char_set.index(char)]
      end
    end
  mutated
  end
end
