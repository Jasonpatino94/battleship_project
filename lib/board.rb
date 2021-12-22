require "byebug"
class Board

    attr_reader :size

    def self.print_grid(grid)
        # debugger
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n,:N) {Array.new(n, :N)}
        @size = n * n
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end 

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        newgrid = @grid.flatten
        num_ships = 0
        newgrid.each {|c| num_ships +=1 if c == :S}
        # debugger
        num_ships
    end

    def attack(pos)
        if self[pos] == :S
            self[pos]=:H
            p 'You sunk my battleship!'
            true
        else
            self[pos]=:X
            false
        end
    end


    def place_random_ships
        totalships = @size * 0.25

        while num_ships < totalships
            randomrow = rand(0...@grid.length)
            randomcolumn = rand(0...@grid.length)
            position = [randomrow,randomcolumn]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |pos|
                if pos == :S
                    pos = :N
                else
                    pos 
                end
            end
        end
    end


    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
