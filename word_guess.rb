require "colorize"

class WordGuess
  attr_reader :word, :wrong_letters, :dashes

  def initialize
    @word = get_word
    @dashes = dashes_array
    @wrong_letters = [] #empty array to hold used letters

    print @word
  end

  def get_word #using this method to use in initialize to call array
    list_of_words = ["lollipop", "elephant", "hotdog", "awesome", "kilometer"].shuffle #shuffle the array so it's different each time
    word_array = list_of_words[0].split(//) #always picking first word in array
  end

  def dashes_array
    length = "_" * @word.length
    dash_array = length.split(//)
    return dash_array
  end

  def add_to_wrong_letters(letter)
    unless @word.include?(letter)
      @wrong_letters << letter
    end
  end

  def display_word(letter = nil)
    unless
      @word.include?(letter) || letter == nil
      add_to_wrong_letters(letter)
    end
    @word.each_with_index do |element, index|
      if element == letter
        @dashes[index] = letter
      end
    end
    wrong_candelabra
    @dashes.each do |i|
      print i + " "
    end
    if @word == @dashes
      puts "You win!"
      exit
    end
    if @wrong_letters.length == 5
      puts ""
      puts "You lose!"
      exit
    end
    puts ""
    puts "Wrong letters:  #{@wrong_letters}."

  end

  def wrong_candelabra
    puts @wrong_letters.length
    puts "$ ".colorize(:yellow) * (5 - @wrong_letters.length)
    puts "| ".colorize(:light_blue) * 5
    puts "|_|_|_|_|".colorize(:light_blue)
    puts "    |".colorize(:light_blue)
    puts "   _|_".colorize(:light_blue)
  end

end

new_game = WordGuess.new
#puts new_word.word

puts "We are going to play a game.  We will 'think' " +
"of a word, and you try to guess the word letter by letter."

new_game.display_word

until new_game.wrong_letters.length == 5 || new_game.word == new_game.dashes
  puts "Please give me a letter."

  is_a_letter = false
  until is_a_letter == true
    letter = gets.chomp.downcase #downcase the letter so always matches
    if /[[:alpha:]]/.match(letter)
      is_a_letter = true
    end
  end
  puts "You chose #{letter}." #so user sees what letter they chose

  new_game.display_word(letter)
end

#new_game.add_to_wrong_letters(letter) #new word is our game
