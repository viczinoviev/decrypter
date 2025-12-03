# frozen_string_literal: true

class CeasarCipherDecrypter
  NUMBER_OF_ALPHABET = ('a'..'z').to_a.length

  def brute_force(string)
    lower_cased_string = string.downcase
    results = Array.new
    (0..NUMBER_OF_ALPHABET - 1).each do |i|
      results << lower_cased_string.chars.map do |character|
        shifted_ascii_value = (character.ord + i)
        if shifted_ascii_value > 'z'.ord
          shifted_ascii_value -= NUMBER_OF_ALPHABET
        end
        shifted_ascii_value.chr
      end.join
    end
    results
  end
end
