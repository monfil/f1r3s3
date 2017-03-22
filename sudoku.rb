class Sudoku
  @@row = 0
  @@col = 0
  @@grid = []

  def initialize(board)
    @board = board
  end

  def check_row_column(grid)

  end

  def check_square(grid)
  end

  def solve!
    #p grid = @board.scan(/........./)
    p @@row, @@col
    if @@grid[@@row][@@col] == "0"
      value = rand(1..9)
      p "Hay un 0"
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

# Driver code
game = Sudoku.new('702806519100740230005001070008000002610204053200000100070400800064078005821503907')
game.solve!