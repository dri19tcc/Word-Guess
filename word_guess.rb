class WordGuess 
  attr_reader :word

  def initialize
    @word = get_word
  end

  def get_word
    list_of_words = ["word1", "word2", "word3"].shuffle
    list_of_words[0]
  end

end

new_word = WordGuess.new
puts new_word.word