class Grid
  def initialize(width, heigth)
    @width = width
    @heigth = heigth
    @positions = Array.new(width) { Array.new(heigth) }
    @ships = [Ship.new(3), Ship.new(4)]

    place_ships
  end

  def place_ships
    puts 'Let\'s start placing your ships...'
    @ships.each {|ship| ask_ship_position(ship)}
  end

  def ask_ship_position(ship)
    puts "Tell me where do you want to place this ship #{ship.print_details}..."
    puts "Use the following format, please. Eg. 0,3"
    # TODO: ask if vertical or horitzontal place
    position = parse_position(gets.chomp)
    return ask_ship_position(ship) unless is_valid_position?(position, ship)
    place_ship(position, ship)
  end

  def parse_position(raw_position)
    position_parser = PositionParser.new(raw_position)
    position_parser.parse
  end

  def has_enough_space?(position, ship)
    position[:x] + ship.size  <= @width
  end

  def grid_position?(position)
    position[:x] < @width && position[:y] < @heigth
  end

  def is_valid_position?(position, ship)
    # TODO: check if it is an empty position
    return true if grid_position?(position) && has_enough_space?(position, ship)
  end

  def place_ship(position, ship)
    (1).upto(ship.size) do |i|
      @positions[position[:x]][position[:y]] = ship.ship_cells[i-1]
      position[:y] += 1
    end
  end

  def shoot_response(shoot)
    position = parse_position(shoot)
    cell = @positions[position[:x]][position[:y]]
    if cell
      cell.shoot
      return cell.sink? ? 'Sink' : 'Hit'
    else
      'Miss'
    end
  end

  def game_over?
    @ships.all? { |ship| ship.sink? }
  end
end
