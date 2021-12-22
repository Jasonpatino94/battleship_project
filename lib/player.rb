require 'byebug'
class Player
    

    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        hey = gets.chomp
        # debugger
       answer = hey.split(" ").map(&:to_i)
      end

end
