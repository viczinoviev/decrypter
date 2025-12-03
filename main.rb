require_relative 'ceasar_cipher_decrypter'
require_relative 'polyalphabetic_shift_decrypter'

decrypter = CeasarCipherDecrypter.new
p decrypter.brute_force('UTABQKAGMXXTMHQMRMZFMEFUONDQMW')


decrypter = PolyalphabeticShiftDecrypter.new(3)
decrypter.brute_force('NMFXXVTKXQBQMUYJIQNDVTKOHQOJUO')