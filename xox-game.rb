    def draw_board(board)
        (0...3).each do |i|
          puts " #{board[i][0]} | #{board[i][1]} | #{board[i][2]}"
          puts "---+---+---" if i < 2
        end
      end
      
      def check_win(board)
        (0...3).each do |i|
          return true if board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != " "
        end
      
        (0...3).each do |j|
            return true if board[0][j] == board[1][j] && board[1][j] == board[2][j] && board[0][j] != " "
        end
      
        return true if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != " "
        return true if board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != ""
      
        false
        end
      
      def get_coordinate(coordinate)
        value = nil
        valid_input = false
      
        until valid_input
        print "Enter #{coordinate} [1-3]: "
          input = gets.chomp
      
          valid_input = input.to_i.to_s == input && (1..3).cover?(value = input.to_i)
      
          puts "Invalid input! Please enter a number between 1 and 3." unless valid_input
        end
      
        value
      end
      
      game_board = Array.new(3) { Array.new(3, " ") }
      player_x = true
      
      moves_count = 0
      game_ended = false
      
      while !game_ended
        system("clear") || system("cls")
        draw_board(game_board)
      
        player = player_x ? "X" : "O"
        puts "Player #{player}, enter your move (row [1-3] and column [1-3]):"
      
        row = get_coordinate("row")
        col = get_coordinate("column")
      
        if game_board[row - 1][col - 1] == " "
          game_board[row - 1][col - 1] = player
          moves_count += 1
        else
          puts "Invalid move! That cell is already taken."
          gets
          next
        end
      
        game_ended = check_win(game_board) || moves_count == 9
        player_x = !player_x
      end
      
      system("clear") || system("cls")
      draw_board(game_board)
      
      if moves_count == 9
        puts "It's a draw!"
      else
        winner = player_x ? "O" : "X"
        puts "Player #{winner} wins!"
      end
