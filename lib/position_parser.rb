class PositionParser
  def initialize(raw_position)
    @raw_position = raw_position
  end

  def parse
    position = @raw_position.split(',')

    {
      x: position[0].to_i,
      y: position[1].to_i
    }
  end
end
