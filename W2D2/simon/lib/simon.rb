class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system('clear')
    end
  end

  def require_sequence
    @seq.each_with_index do |color, i|
      "Enter the number #{i} color: "
      input = gets.chomp
      if input != color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    rand_i = Random.new.rand(0..3)
    @seq << COLORS[rand_i]
  end

  def round_success_message
    puts "You've survived this round!"
  end

  def game_over_message
    puts "Congratulations surviving this long!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
