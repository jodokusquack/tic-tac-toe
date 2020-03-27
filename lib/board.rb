#/!/usr/bin/env ruby

class Board

  attr_accessor :cells

  def initialize()
    @cells = [
      [Cell.new(" "),Cell.new(" "),Cell.new(" ")],
      [Cell.new(" "),Cell.new(" "),Cell.new(" ")],
      [Cell.new(" "),Cell.new(" "),Cell.new(" ")] 
    ]
  end

  # draw() draws the board in its current state
  def draw()
    # clear the screen before each drawing step
    system "clear"

    puts("    "+"1".bold+"   "+"2".bold+"   "+"3".bold)
    puts
    puts(" "+"1".bold+"  "+ @cells[0][0].content + " | " + @cells[0][1].content + " | " + @cells[0][2].content)
    puts "   ------------"
    puts(" "+"2".bold+"  "+ @cells[1][0].content + " | " + @cells[1][1].content + " | " + @cells[1][2].content)
    puts "   ------------"
    puts(" "+"3".bold+"  "+ @cells[2][0].content + " | " + @cells[2][1].content + " | " + @cells[2][2].content)
    puts
  end

  def draw_move(sign, row, col)
    if @cells[row][col].content != " "
      raise ArgumentError, "You have to select an empty field!"
    end
    @cells[row][col].content = sign
    draw
    return winner?(row, col)
  end

  private

  def winner?(last_row, last_col)
    return (check_col?(last_col) or check_row?(last_row) or check_diagonals?())
  end

  def check_col?(col)
    return (@cells[0][col] == @cells[1][col] and @cells[1][col] == @cells[2][col])
  end

  def check_row?(row)
    return (@cells[row][0] == @cells[row][1] and @cells[row][1] == @cells[row][2])
  end

  def check_diagonals?()
    diag1 = (@cells[0][0] == @cells[1][1] and @cells[1][1] == @cells[2][2])
    diag2 = (@cells[0][2] == @cells[1][1] and @cells[1][1] == @cells[2][0])
    return (diag1 or diag2)
  end
end

# define some formatting functions
class String
  def underline()
    return "\e[4m#{self}\e[0m"
  end
  def bold()
    return "\e[1m#{self}\e[0m"
  end
end
