require_relative 'ceasar_cipher_decrypter'

class PolyalphabeticShiftDecrypter
  def initialize(number_alphabets)
    @number_alphabets = number_alphabets
    @sub_strings = Array.new(number_alphabets) {Array.new}
    @caesar_decrypter = CeasarCipherDecrypter.new
  end

  def brute_force(ciphertext)
    split(ciphertext)
    shifted_substrings = Array.new(@number_alphabets) {Array.new}
    @sub_strings.each_with_index { |sub_string, index|
      shifted_substrings[index] = @caesar_decrypter.brute_force(sub_string.join)
    }
    possible_combinations = Array.new(@number_alphabets)

    File.open("result.txt", "a") do |file|
      for i in 0..shifted_substrings[0].length-1
        for j in 0..shifted_substrings[0].length-1
          for k in 0..shifted_substrings[0].length-1
            possible_combinations[0] = shifted_substrings[0][i].chars
            possible_combinations[1] = shifted_substrings[1][j].chars
            possible_combinations[2] = shifted_substrings[2][k].chars
            file.puts "#{i},#{j},#{k}: #{join(possible_combinations)}"
          end
        end
      end
    end

  end

  private

  def split(ciphertext)
    ciphertext.chars.each_with_index do |character, index|
      @sub_strings[index % @number_alphabets] << character
    end
  end

  def join(characters_of_sub_strings)
    result = Array.new
    characters_of_sub_strings.each_with_index do |character_array, i|
      character_array.each_with_index do |character, j|
        result[(j * @number_alphabets) + i] = character
      end
    end
    result.join
  end
end