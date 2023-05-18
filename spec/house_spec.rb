require './lib/room'
require './lib/house'

RSpec.describe Room do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(room).to be_a Room
    end

    it "it has a price" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq(400000)
    end

    it "it has an address" do
      house = House.new("$400000", "123 sugar lane")

      expect(room.address).to eq("123 sugar lane")
    end

    it "has an empty rooms array" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.rooms).to eq([])
    end

    it "can have rooms added into the array" do
      room = Room.new(:bedroom, 10, '13')

      expect(room.is_painted?).to eq(false)
    end

    it "the paint method will change is_painted to true" do
      room = Room.new(:bedroom, 10, '13')
      room.paint
      expect(room.is_painted?).to eq(true)
    end
  end
end
