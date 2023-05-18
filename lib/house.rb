class House
  attr_reader :price, :address, :rooms
  
  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 500000
      return true
    else
      return false
    end
  end

  def rooms_from_category(category)
    rooms.find_all {|room| room.category == category}
  end

  def area
    total_area = 0
    rooms.each do |room| 
      total_area += room.area
    end
    total_area
  end
end