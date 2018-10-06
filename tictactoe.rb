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

# method for all the possible choices the user can enter and which position they corespond with
# def user_choice
#     possible_moves = {
#         board[0]: "a1",
#         board[1]: "a2",
#         board[2]: "a3",
#         board[3]: "b1",
#         board[4]: "b2",
#         board[5]: "b3",
#         board[6]: "c1",
#         board[7]: "c2",
#         board[8]: "c3",
# end

# method if player is an "X" or "O"
def player_token num
    if num == 1
        player_token = "X"
    else
        player_token = "O"
    end
end

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
        puts "Oops! That move does not exist, please try again."
        puts
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
            exit 
        elsif item[0] == "O" && item[1] == "O" && item[2] == "O"
            puts "Player Two wins!"
            exit
        end
    end
end

# Start of the game
puts "Let's play Tic Tac Toe!"
puts
sleep 1

# displays the empty board
puts display_board(board)
sleep 1

# create loop until there is a win, draw or they would like to cancel the game
while true
 
    print "Player One >> Please select one coordinate for your move (eg. A3): "
    player_one_move = gets.chomp.downcase
    puts

    move_on_board(player_one_move, board, 1)
    puts
    check_for_winner(board)

    print "Player Two >> Please select one coordinate for your move (eg. A3): "
    player_two_move = gets.chomp.downcase
    puts

    move_on_board(player_two_move, board, 2)
    puts
    check_for_winner(board)

end

