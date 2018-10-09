require 'colorize'

# an array that holds players moves
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# method which displays the board to users
def display_board board

    puts "  1   2   3"
    puts "A #{board[0]} | #{board[1]} | #{board[2]}"
    puts "  ----------"
    puts "B #{board[3]} | #{board[4]} | #{board[5]}"
    puts "  ----------"
    puts "C #{board[6]} | #{board[7]} | #{board[8]}"

end

# method to assign all possible choices to their corresonponding position on the board
def user_choice board, move

    if move == "a1"
        board_position = board[0]
    elsif move == "a2"
        board_position = board[1]
    elsif move == "a3"
        board_position = board[2]
    elsif move == "b1"
        board_position = board[3]
    elsif move == "b2"
        board_position = board[4]
    elsif move == "b3"
        board_position = board[5]
    elsif move == "c1"
        board_position = board[6]
    elsif move == "c2"
        board_position = board[7]
    elsif move == "c3"
        board_position = board[8]
    end

    return board_position

end

# method to place the players choice of move on the board
def move_on_board move, board, token

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
    elsif move == "q"
        exit
    end

end

# method for checking if there is a winner
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
            puts "Player X wins! You are the Tic Tac Toe Master!".colorize(:red)
            puts
            sleep 1
            exit 
        elsif item[0] == "O" && item[1] == "O" && item[2] == "O"
            puts "Player O wins! You are the Tic Tac Toe Master!".colorize(:red)
            puts
            sleep 1
            exit
        end

    end

end

# Start of the game
puts "Let's play Tic Tac Toe!"
puts
sleep 1

puts "Press q at any turn to quit the game"
puts
sleep 1

puts display_board(board)
sleep 1

# method for each players turn to make a move
def player_turn board, player

    # ask a player to select their move
    print "Player #{player} >> Please select one coordinate for your move (eg. A3): "
    player_move = gets.chomp.downcase
    puts

    # allows players to quit the game
    if player_move == "q"
        puts "Thanks for playing! Goodbye :)".colorize(:red)
        puts
        sleep 1
        exit 
    end

    # loop until the player has made a valid move
    while true

        if user_choice(board, player_move) == " "
            move_on_board(player_move, board, player)
            break
        else
            print "Oops! That move is invalid. Try again: "
            player_move = gets.chomp.downcase
            puts
        end

    end

end

# game loop until there is a win, draw or a player quits
counter = 0

while counter <= 9

    # selecting whether the player is an "X" or an "O"
    counter += 1
    if counter % 2 != 0
        player = "X"
    else
        player = "O"
    end

    # once the player has had their turn, the updated board is displayed
    player_turn(board, player)
    puts
    system 'clear'
    display_board(board)
    puts
    check_for_winner(board)

    # once the counter reaches nine, there are no more choices for moves on the board. This will mean, there is a draw
    if counter == 9
        puts "It's a draw!".colorize(:red)
        puts
        exit
    end

end


