require './lib/room'
require './lib/house'

RSpec.describe Room do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a House
    end

    it "it has a price" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq(400000)
    end

    it "it has an address" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.address).to eq("123 sugar lane")
    end

    it "has an empty rooms array" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.rooms).to eq([])
    end

    it "can have rooms added into the array" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.rooms).to eq([room_1, room_2])
    end
  end
  
  describe "Iteration 3" do
    
    it "can return false if the house is not above market average" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.above_market_average?).to eq(false)
    end

    it "can return true if the market is above market average" do
      house = House.new("$750000", "123 sugar lane")
      expect(house.above_market_average?).to eq(true)
    end

    it "can separate rooms by category" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
      expect(house.rooms_from_category(:basement)).to eq([room_4])
    end

    it "can determine the area of all the rooms in the house" do
      house = House.new("$400000", "123 sugar lane")
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.area).to eq(1900)
    end

    it "can return the details of the house as a hash" do
      house = House.new("$400000", "123 sugar lane")
      expected = {
        price: 400000,
        address: "123 sugar lane"
      }
      expect(house.details).to eq(expected)
    end
  end

  describe "Iteration 4" do

    it "can determine the price per square foot" do
      house = House.new("$400000", "123 sugar lane")
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.price_per_square_foot).to eq(210.53)
    end

    it "sort the rooms of a house by area" do
      house = House.new("$400000", "123 sugar lane")
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_sorted_by_area).to eq([room_1, room_2, room_3, room_4])
    end

    it "can sort the rooms of a house by category" do
      house = House.new("$400000", "123 sugar lane")
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expected = {
        bedroom: [room_1, room_2],
        living_room: [room_3],
        basement: [room_4]
      }
      expect(house.rooms_by_category).to eq(expected)
    end


  end
end
