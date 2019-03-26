require 'pry'

class PigLatinizer
  attr_reader :string

  def piglatinize(string)
    words = string.split(" ")
    pig_string = []

    words.each do |word|
      if word[0].start_with?(/^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWYZ]/) &&
        word[1] =~ /[aeiou]/
          pig_string << word[1..]+ word[0] + "ay"

      elsif word.start_with?(/^[aeiouAIEOU]/)
        pig_string << word + "way"
#binding.pry
      elsif word[0..1] =~ /[bcdfghjklmnpqrstvwxyz]/ &&
        word[2] =~ /[aeiou]/
          pig_string << word[2..] + word[0..1] + "ay"

      elsif word[0..2] =~ /[bcdfghjklmnpqrstvwxyz]/ &&
        word[3] =~ /[aeiou]/
          pig_string << word[3..] + word[0..2] + "ay"

      else
        pig_string << word
      end
    end
    pig_string.join(" ")

  end

end
