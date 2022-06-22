require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, hash) # ("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)
        @name = name
        @rooms = Hash.new {|h, key| h[key] = 0}
        hash.each do |k, v|
            @rooms[k] = Room.new(hash[k]) 
        end
        
    end

    def name
        cap_name = @name.split(" ").map do |word|
            word.capitalize
        end
        cap_name.join(" ")
    end
    
    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        end
        false
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |k, v|
            if v.full?
                return false
            else
                return true
            end
        end
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k + "." + v.available_space.to_s
        end
    end

end









#     describe "#list_rooms" do
#       it "should print out every room name followed by the number of available spaces in that room" do
#         hotel.check_in("Harry", "Under the Stairs")
#         expect { hotel.list_rooms }.to output(/Basement.*4\nAttic.*2\nUnder the Stairs.*0\n/).to_stdout
#       end

#       it "should call Room#available_space" do
#         expect(hotel.rooms["Basement"]).to receive(:available_space)
#         hotel.list_rooms
#       end
#     end
#   end
# end
