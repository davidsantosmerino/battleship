class ShipCell
  attr_reader :hit
  
  def initialize(ship)
    @ship = ship
    @hit = false
  end

  def shoot
    @hit = true
  end

  def sink?
    return true if @ship.sink?
  end
end
