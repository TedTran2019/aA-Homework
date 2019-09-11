class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if [6, 13].include?(i)

      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(0, 5) ||
                                        start_pos.between?(7, 12)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    nbr_stones = @cups[start_pos].length
    @cups[start_pos] = []
    until nbr_stones == 0
      start_pos += 1
      start_pos += 1 if (start_pos == 13 && current_player_name == @name1) ||
                        (start_pos == 6 && current_player_name == @name2)
      start_pos = 0 if start_pos == 14
      
      nbr_stones -= 1
      @cups[start_pos] << :stone
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if [6, 13].include?(ending_cup_idx)
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? } ||
                   @cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    if @cups[6] == @cups[13]
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end
