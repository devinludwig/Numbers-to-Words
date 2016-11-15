class Fixnum
  define_method(:numbers_to_words) do
    final_word = ''
    one_place_words = {1 => 'one', 0 => 'zero', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine'}
    teen_words = {10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'}
    tens_place_words = {0 => '', 2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty', 6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety'}
    # if self.<10
    #   one_place_words.fetch(self)
    # elsif self.< 20
    #   teen_words.fetch(self)
    # elsif self.>= 20
      digits = to_s().split('')
    #     final_word.prepend(one_place_words.fetch(digits.at(-1).to_i()))
    #     final_word.prepend(tens_place_words.fetch(digits.at(-2).to_i()) + " ")
    #

    if !(digits.at(-2).to_i().==1)
      final_word.prepend(one_place_words.fetch(digits.at(-1).to_i()))
    end
    if digits.at(-2).to_i().==1
      final_word.prepend(teen_words.fetch(digits.at(-2).concat(digits.at(-1)).to_i()))
    elsif (digits.length.>1) && !(digits.at(-2).=="0")
        final_word.prepend(tens_place_words.fetch(digits.at(-2).to_i()) + " ")

    end
    if digits.length.>2
      final_word.prepend(one_place_words.fetch(digits.at(-3).to_i()) + " hundred ")
    end
    if (digits.length.>3) && !(digits.at(-5).to_i().==1)
      final_word.prepend(one_place_words.fetch(digits.at(-4).to_i()) + " thousand ")
    end
    if (digits.length.>4) && (digits.at(-5).to_i().==1)
      final_word.prepend(teen_words.fetch(digits.at(-5).concat(digits.at(-4)).to_i()) + " thousand ")
    elsif (digits.length.>4)
        final_word.prepend(tens_place_words.fetch(digits.at(-5).to_i()) + " ")
    end
    if digits.length.>5
      final_word.prepend(one_place_words.fetch(digits.at(-6).to_i()) + " hundred ")
    end
    if digits.length.>6
      final_word.prepend(one_place_words.fetch(digits.at(-7).to_i()) + " million ")
    end

    final_word
  end
end
