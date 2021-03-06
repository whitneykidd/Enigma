require 'date'

class Cipher
  attr_reader :char_set, :date
  def initialize
    @char_set = ('a'..'z').to_a << ' '
    @date = Date.today.strftime('%d%m%y')
  end

  def generate_key
    "0" + rand(9999).to_s.rjust(4, "0")
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

  def generate_shifts(key, date, direction)
    offsets = generate_offsets(date)
    separate_keys(key).merge(offsets) do |_, key, offset|
      (key + offset) * direction
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
       # require "pry"; binding.pry
      else
        mutated += char
      end
    end
  mutated
  end
end
