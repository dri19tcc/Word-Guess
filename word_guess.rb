class WordGuess
  attr_reader :word

  def initialize
    @word = get_word
    @dashes = dashes_array
    @used_letters = [] #empty array to hold used letters

    print @word
  end

  def get_word #using this method to use in initialize to call array
    list_of_words = ["word1", "word22", "word333"].shuffle #shuffle the array so it's different each time
    word_array = list_of_words[0].split(//) #always picking first word in array
  end

  def dashes_array
    length = "_" * @word.length
    dash_array = length.split(//)
    return dash_array
  end

  def add_to_used_letters(letter)
    @used_letters << letter
    puts "You've used the following letters:  #{@used_letters}."
  end

  def display_word(letter = "")
    @word.each_with_index do |element, index|
      if element == letter
        @dashes[index] = letter
      end
    end
    @dashes.each do |i|
      print i + " "
    end
    puts ""
  end

end

new_game = WordGuess.new
#puts new_word.word

puts "We are going to play a game.  We will 'think' " +
"of a word, and you try to guess the word letter by letter."
puts "Please give me a letter."
new_game.display_word

letter = gets.chomp.downcase #downcase the letter so always matches
puts "You chose #{letter}." #so user sees what letter they chose

new_game.display_word(letter)


new_game.add_to_used_letters(letter) #new word is our game
