class Game
  def initialize
    @players = []
  end

  def start
    puts '--------------------------------'
    puts '|        Battleship Game       |'
    puts '--------------------------------'
    1.upto(2) {|index| setup_player  }

    play
  end

  def setup_player
    create_player
  end

  def create_player
    puts 'Hey! What\'s your name?'
    name = gets.chomp
    @players << Player.new(name)
  end

  def play
    turn
  end

  def turn
    @players.each_with_index do |player, index|
      opponent = @players[(index - 1).abs]
      puts "It's your turn, #{player.name}!"
      puts "Select a coordinate to shoot your opponent..."
      attempt = player.shoot
      opponent.shoot_response(attempt)
    end

    turn
  end
end
