require 'colorize'

# method for displaying the tictactoe board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board board
    puts "  1   2   3"
    puts "A #{board[0]} | #{board[1]} | #{board[2]}"
    puts "  ----------"
    puts "B #{board[3]} | #{board[4]} | #{board[5]}"
    puts "  ----------"
    puts "C #{board[6]} | #{board[7]} | #{board[8]}"
end

# method if player is an "X" or "O"
def player_token num
    if num == 1
        player_token = "X"
    else
        player_token = "O"
    end
end

# method for testing if the spot is available
# def valid_move board_position, token
#     if board_position == " "
#         board_position = "#{token}"
#     else 
#         puts "That spot is taken! Try again"
#     end
# end

# SHORTER method for adding users input on to the board - does not work
# def move_on_board move, board, num
#     token = player_token(num)
#     board.each_with_index do |item, i|
#         if item == move
#             board[i] = "#{token}"
#         else
#             puts "Oops! That move does not exist, please try again."
#         end
#     end
# end

def move_on_board move, board, num
    token = player_token(num)
    if move == "a1"
        if board[0] == " "
            board[0] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "a2"
        if board[1] == " "
            board[1] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "a3"
        if board[2] == " "
            board[2] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "b1"
        if board[3] == " "
            board[3] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "b2"
        if board[4] == " "
            board[4] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "b3"
        if board[5] == " "
            board[5] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "c1"
        if board[6] == " "
            board[6] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "c2"
        if board[7] == " "
            board[7] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    elsif move == "c3"
        if board[8] == " "
            board[8] = "#{token}"
        else
            puts "That spot is taken! Try again"
        end
    else
        puts "Oops! That move does not exist, please try again."
        puts
    end
end

# method for checking if there is a winner or draw
def check_for_winner board

    winner_combinations = [
        [board[0], board[1], board[2]],
        [board[0], board[4], board[8]],
        [board[0], board[3], board[6]],
        [board[3], board[4], board[5]],
        [board[6], board[7], board[8]],
        [board[6], board[4], board[2]],
        [board[1], board[4], board[7]],
        [board[2], board[5], board[8]]
    ]

    winner_combinations.each do |item| 
        if item[0] == "X" && item[1] == "X" && item[2] == "X"
            puts "Player One wins!"
            sleep 1
            exit 
        elsif item[0] == "O" && item[1] == "O" && item[2] == "O"
            puts "Player Two wins!"
            sleep 1
            exit
        end
    end
end

# method for every player's turn

# Start of the game
puts "Let's play Tic Tac Toe!"
puts
sleep 1

puts display_board(board)
sleep 1

# create loop until there is a win, draw or they would like to cancel the game
while true
 
    print "Player One >> Please select one coordinate for your move (eg. A3): "
    player_one_move = gets.chomp.downcase
    puts
    
    move_on_board(player_one_move, board, 1)
    display_board(board)
    puts
    check_for_winner(board)

    print "Player Two >> Please select one coordinate for your move (eg. A3): "
    player_two_move = gets.chomp.downcase
    puts

    move_on_board(player_two_move, board, 2)
    display_board(board)
    puts
    check_for_winner(board)

end

