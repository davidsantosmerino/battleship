class Ship
  attr_reader :size, :ship_cells

  def initialize(size)
    @size = size
    @ship_cells = []

    setup
  end

  def setup
    ship_cells_setup
  end

  def ship_cells_setup
    1.upto(@size) do
      @ship_cells << ShipCell.new(self)
    end
  end

  def presenter
    @presenter ||= ShipPresenter.new(self)
  end

  def print_details
    presenter.print_details
  end

  def sink?
    @ship_cells.all? { |cell| cell.hit }
  end
end
