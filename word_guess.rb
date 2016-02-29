require "colorize"
require "rainbow"
require "artii"

class WordGuess
  attr_reader :word, :wrong_letters, :dashes

  def initialize
    @word = get_word
    @dashes = dashes_array
    @wrong_letters = [] #empty array to hold used letters
  end

  def get_word #using this method to use in initialize to call array
    list_of_words = ["development", "digestion", "window", "yesterday", "separate", "disease", "carriage", "punishment", "transport", "tomorrow", "instrument", "competition", "representative",
      "achievement", "stomach", "observation", "tendency", "building", "business", "attention", "attraction", "behavior", "questionnaire", "susceptible", "lollipop", "elephant", "hotdog", "awesome",
      "kilometer", "treasure", "dominoes", "electricity", "lightsaber", "battery", "circumference", "eloquent", "impeccable", "meticulous", "predilection", "superfluous", "vociferous", "zenith"].shuffle #shuffle the array so it's different each time
    word_array = list_of_words[0].split(//) #always picking first word in array
  end

  def dashes_array
    length = "_" * @word.length #.each use regex to check letter, if it's a letter...
    dash_array = length.split(//)#// splits on a character
    return dash_array
  end

  def add_to_wrong_letters(letter)
    unless @word.include?(letter)
      @wrong_letters << letter
    end
  end

  def display_word(letter = nil)
    if !@word.include?(letter) && letter != nil && !@wrong_letters.include?(letter)
      add_to_wrong_letters(letter)
    end #if letter hasn't been guessed already, and it's not nothing, and it's not in the word
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
      puts ""
      puts Rainbow("You win!").green.blink
      exit
    end
    if @wrong_letters.length == 5
      puts ""
      puts Rainbow("You lose!  The word was #{@word.join}").red.blink
      exit
    end
    puts ""
    puts ""
    puts "Wrong letters:  #{@wrong_letters}."
    puts ""

  end

  # easy version populates word with vowels
  def easy_version
    vowels = ["a", "e", "i", "o", "u"]
    5.times do |i|
      vowel = vowels[i]
      @word.each_with_index do |element, index|
        if element == vowel
          @dashes[index] = vowel
        end
      end
    end
  end

  def wrong_candelabra
    #puts @wrong_letters.length
    puts "$ ".colorize(:yellow) * (5 - @wrong_letters.length)
    puts "| ".colorize(:light_blue) * 5
    puts "|_|_|_|_|".colorize(:light_blue)
    puts "    |".colorize(:light_blue)
    puts "   _|_".colorize(:light_blue)
    puts ""
  end

end

new_game = WordGuess.new
#puts new_word.word

a = Artii::Base.new :font => 'slant'
puts a.asciify('Word Guess').colorize(:cyan)
puts a.asciify('Game!').colorize(:cyan)

puts "We are going to play a game.  We will 'think' "
puts "of a word, and you try to guess the word letter by letter."
puts ""
puts "Do you want easy or normal mode?"
mode = gets.chomp.downcase
if mode == "easy"
  new_game.easy_version
end
new_game.display_word


until new_game.wrong_letters.length == 5 || new_game.word == new_game.dashes
  puts "Please give me a letter."

  is_a_letter = false
  until is_a_letter == true
    letter = gets.chomp.downcase #downcase the letter so always matches
    #if /[[:alpha:]]/.match(letter)
    if /^[a-zA-Z]$/.match(letter)
      is_a_letter = true
    else
      puts "That's not a letter, try again!"
    end
  end
  puts ("You chose #{letter}.").colorize(:red).on_blue #so user sees what letter they chose
    if new_game.wrong_letters.include?(letter)
      puts "You already chose #{letter}, please give another letter."
    end

  new_game.display_word(letter)
end

#new_game.add_to_wrong_letters(letter) #new word is our game
