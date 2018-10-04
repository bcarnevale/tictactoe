require 'colorize'

# method for the empty board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board board
    puts "  1   2   3"
    puts "A #{board[0]} | #{board[1]} | #{board[2]}"
    puts "  ----------"
    puts "B #{board[3]} | #{board[4]} | #{board[5]}"
    puts "  ----------"
    puts "C #{board[6]} | #{board[7]} | #{board[8]}"
end

# method for adding input to board
def move_on_board move, board
    if move == "a1"
        board[0] = "X"
    elsif move == "a2"
        board[1] = "X"
    elsif move == "a3"
        board[2] = "X"
    elsif move == "b1"
        board[3] = "X"
    elsif move == "b2"
        board[4] = "X"
    elsif move == "b3"
        board[5] = "X"
    elsif move == "c1"
        board[6] = "X"
    elsif move == "c2"
        board[7] = "X"
    elsif move == "c3"
        board[8] = "X"
    else
        puts "Try again!"
    end
    p display_board(board)
end

# method for testing if the spot is available

# method for checking if there is a winner or draw
def winning board
    winner = [
        ["a1", "a2", "a3"],
        ["a1", "b2", "c3"],
        ["a1", "b1", "c1"],
        ["b1", "b2", "b3"],
        ["c1", "c2", "c3"],
        ["c1", "b2", "a3"],
        ["a2", "b2", "c2"],
        ["a3", "b3", "c3"]
    ]
end

# welcome the players
puts "Let's play Tic Tac Toe!"
puts
sleep 1

# display the empty board
puts display_board(board)
sleep 1

# create loop until there is a win, draw or they would like to cancel the game

    # instruct player one to choose a position
    print "Player One >> Please select one coordinate for your move (eg. a3): "
    player_one_move = gets.chomp.downcase

    # present the board with the position of player one
    move_on_board(player_one_move, board)

    # instruct player two to choose a position
    print "Player Two >> Please select one coordinate for your move (eg. a3): "
    player_two_move = gets.chomp.downcase

    # place player_one_move into the board
    move_on_board(player_two_move, board)

    # check if they are a winner

# end

# set up a win message, draw message and goodbye message dependent on the outcome

