class Player
  attr_reader :name
  def initialize(name)
    @name = name
    @grid = Grid.new(5, 5)
  end

  def shoot
    gets.chomp
  end

  def shoot_response(shoot)
    puts @grid.shoot_response(shoot)
  end
end
