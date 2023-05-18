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

  def details
    {
      price: @price,
      address: @address
    }
  end

  def price_per_square_foot
    (@price.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    rooms.sort_by {|room| room.area}
  end

  def rooms_by_category
  bedroom_array = rooms_from_category(:bedroom)
  living_room_array = rooms_from_category(:living_room)
  basement_array = rooms_from_category(:basement)

  {
    bedroom: bedroom_array,
    living_room: living_room_array,
    basement: basement_array
  }
  end
end