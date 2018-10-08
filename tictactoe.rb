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

# method for all possible choices
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

# method to place the players move on the board
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
    else
        puts "Oops! That move does not exist, try again."
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
            puts
            sleep 1
            exit 
        elsif item[0] == "O" && item[1] == "O" && item[2] == "O"
            puts "Player Two wins!"
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

puts "Press q at any players turn to quit."
puts
sleep 1

puts display_board(board)
sleep 1

# player one turn
def player_turn board, player

        print "Player #{player} >> Please select one coordinate for your move (eg. A3): "
        player_move = gets.chomp.downcase
        puts

        if player_move == "q"
            puts "Thanks for playing! Goodbye."
            puts
            sleep 1
            exit
        end

        while true
            if user_choice(board, player_move) == " "
                move_on_board(player_move, board, player)
                break
            else
                print "That spot is taken! Try again: "
                player_move = gets.chomp.downcase
                puts
            end
        end

end

# create loop until there is a win, draw or they would like to cancel the game
counter = 0
while counter <= 9

    counter += 1
    if counter % 2 != 0
        player = "X"
    else
        player = "O"
    end

    player_turn(board, player)
    puts
    system 'clear'
    display_board(board)
    puts
    check_for_winner(board)

    if counter == 9
        puts "It's a draw!"
        puts
        exit
    end

end


