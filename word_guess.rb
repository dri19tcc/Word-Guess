class WordGuess
  attr_reader :word

  def initialize
    @word = get_word
    @used_letters = [] #empty array to hold used letters
  end

  def get_word #using this method to use in initialize to call array
    list_of_words = ["word1", "word2", "word3"].shuffle #shuffle the array so it's different each time
    list_of_words[0] #always picking first word in array
  end

  def add_to_used_letters(letter)
    @used_letters << letter
    puts "You've used the following letters:  #{@used_letters}."
  end

end

new_game = WordGuess.new
#puts new_word.word

puts "We are going to play a game.  We will 'think' " +
"of a word, and you try to guess the word letter by letter."
puts "Please give me a letter."
letter = gets.chomp.downcase #downcase the letter so always matches
puts "You chose #{letter}." #so user sees what letter they chose

new_game.add_to_used_letters(letter) #new word is our game
