class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...13).each {|i| 4.times{cups[i] << :stone} unless i == 6}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0 || start_pos == 6
    raise "Starting cup is empty" if cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    valid_move?(start_pos)
    stones, cups[start_pos] = cups[start_pos], []
    other_player_cup = current_player_name == @name1 ? 13 : 6
    until stones.empty?
      start_pos += 1
      start_pos %= 14
      cups[start_pos] << stones.pop unless start_pos == other_player_cup
    end
    render
    next_turn(start_pos)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 13 || ending_cup_idx == 6
      :prompt
    elsif cups[ending_cup_idx].count == 1
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
    return true if cups[0..5].all?{|cup| cup.empty?} || cups[7..12].all?{|cup| cup.empty?}
    false
  end

  def winner
    if cups[6].count == cups[13].count
      return :draw
    elsif cups[6].count > cups[13].count
      return @name1
    else
      return @name2
    end
  end
end
