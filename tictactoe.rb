require 'colorize'

# method for displaying an empty board
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

# method for adding input to board
def move_on_board move, board, num
    token = player_token(num)
    if move == "a1"
        board[0] = "#{token}"
    elsif move == "a2"
        board[1] = "#{token}"
    elsif move == "a3"
        board[2] = "#{token}"
    elsif move == "b1"
        board[3] = "#{token}"
    elsif move == "b2"
        board[4] = "#{token}"
    elsif move == "b3"
        board[5] = "#{token}"
    elsif move == "c1"
        board[6] = "#{token}"
    elsif move == "c2"
        board[7] = "#{token}"
    elsif move == "c3"
        board[8] = "#{token}"
    else
        puts "Try again!"
    end
    display_board(board)
end

# method for testing if the spot is available
def availability position
    if position == " "
        true
    else
        puts "That spot is taken! Try again"
    end
end

# method for checking if there is a winner or draw
# def winning board
#     winner = [
#         [board[0], board[1], board[2]],
#         [board[0], board[4], board[8]],
#         [board[0], board[3], board[6]],
#         [board[3], board[4], board[5]],
#         [board[6], board[7], board[8]],
#         [board[6], board[4], board[2]],
#         [board[1], board[4], board[7]],
#         [board[2], board[5], board[8]]
#     ]

#     winner.each_with_index do |item, i|
#         if winner[i] == ["X", "X", "X"] || ["O", "O", "O"]
#             puts "We have a winner!!"
#         end
#     end
# end

# welcome the players
puts "Let's play Tic Tac Toe!"
puts
sleep 1

# display the empty board
puts display_board(board)
sleep 1

# create loop until there is a win, draw or they would like to cancel the game
while true

    # instruct player one to choose a position  
    print "Player One >> Please select one coordinate for your move (eg. a3): "
    player_one_move = gets.chomp.downcase
    puts

    availability(player_one_move)
    # present the board with the position of player one
    move_on_board(player_one_move, board, 1)
    puts

    # instruct player two to choose a position
    print "Player Two >> Please select one coordinate for your move (eg. a3): "
    player_two_move = gets.chomp.downcase
    puts

    availability(player_two_move)
    # place player_one_move into the board
    move_on_board(player_two_move, board, 2)
    puts

end

# set up a win message, draw message and goodbye message dependent on the outcome

