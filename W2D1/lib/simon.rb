require "colorize"
require "byebug"
class Simon
  COLORS = %w(red blue green yellow)
  COLOR_MAP = {
    "red" => "red".red,
    "blue" => "blue".blue,
    "green" => "green".green,
    "yellow" => "yellow".yellow
  }

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
  ensure
    reset_game
  end

  def take_turn
    show_sequence
    if require_sequence
      round_success_message
    else
      game_over = true
    end


  end

  def show_sequence
    add_random_color
    seq.each do |color|
      system("clear")
      puts display_colors(color)
      sleep 1
      system("clear")
      sleep 1
    end
  end

  def require_sequence
    puts "Input colors"
    seq.each do |color|
      unless color == gets.chomp
        @game_over = true
        return
      end
    end
    system("clear")
    true
  end

  def add_random_color
    seq << COLORS[Random.rand(COLORS.length)]
    @sequence_length = seq.length
    
  end

  def round_success_message
    puts "You won Round #{sequence_length}"
    sleep 1
  end

  def game_over_message
    puts "You Lose. Score: #{sequence_length}"
  end

  def reset_game
    self.game_over = false
    self.sequence_length = 1
    self.seq = []
  end

  def display_colors(color)
    # color #add colorize for colored text
    COLOR_MAP[color]
  end
end
