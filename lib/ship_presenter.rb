class ShipPresenter
  def initialize(ship)
    @ship = ship
  end

  def print_details
    '*' * @ship.size
  end
end
