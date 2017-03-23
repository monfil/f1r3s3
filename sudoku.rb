require 'matrix'

class Sudoku
  @@row = 0
  @@col = 0
  @@grid = []
  @@count = 0

  def initialize(board)
    @board = board
    fill_grid!
  end

  def fill_grid!
    @@grid = @board.scan(/........./)
  end

  def in_row_column?(number, row, col)
    matrix = Matrix[*@@grid.map{|item| item.split(//)}]
    return p true if matrix.row(row).include?(number)
    return p true if matrix.column(col).include?(number)
  end

  def in_square?(number, row, col)
    if row >= 0 && row <= 2
      start_row = 0
      top_row = 2
    elsif row >= 3 && row <= 5
      start_row = 3
      top_row = 5
    elsif row >= 6 && row <= 8
      start_row = 6
      top_row = 8
    end

    if col >= 0 && col <= 2
      start_col = 0
      top_col = 2
    elsif col >= 3 && col <= 5
      start_col = 3
      top_col = 5
    elsif col >= 6 && col <= 8
      start_col = 6
      top_col = 8
    end

    p "Está en el rango #{start_row}, #{start_col} y #{top_row}, #{top_col}"

    for x in start_row..top_row
      for y in start_col..top_col
        return p true if number == @@grid[x][y] 
      end
    end
  end

  def solve!
    p "coordenadas #{@@row}, #{@@col}"
    if @@grid[@@row][@@col] == "0"
      p "********HAY UN CERO"
      number = rand(1..9).to_s
      p "el numero es #{number}"
      if in_row_column?(number, @@row, @@col) == true || in_square?(number, @@row, @@col) == true
        @@count += 1
        solve!
      else
        @@grid[@@row][@@col] = number
        p "*****SE CAMBIÓ EL 0 POR #{number}"
        p @@grid
      end
    else
      while @@col < 9
        @@col += 1
        if @@col == 9
          @@col = 0
          @@row += 1
        end
        return if @@row > 8
        solve!
      end
    end
  end

  def board

  end
end

# https://github.com/ccjav/fase1-1/blob/master/semana1/viernes/sudoku.rb
# Driver code
game = Sudoku.new('702806519100740230005001070008000002610204053200000100070400800064078005821503907')
game.solve!