require_relative 'commands'

class Turn 
  def initialize(player_board, computer_board, player, computer)
    @player_board = player_board
    @computer_board = computer_board
    @player = player
    @computer = computer
  end 

  def display_boards 
    puts "======PLAYER BOARD======"
    @player_board.render
    puts "======COMPUTER BOARD======"
    @computer_board.render
  end 
  
  # Ask the player for a shot
  def player_turn 
    player_input = Commands.choose_coordinates     
    if  Commands.check_guess(@player, player_input)  
     player_guess = @computer_board.cells[player_input]
     player_guess.fire_upon
     return player_guess
    else 
      puts "something's not quite right" 
    end
  end 
  
  def computer_turn
    random_cell = @player_board.cells.keys.sample
    if Commands.check_guess(@computer, random_cell)
      computer_guess = @player_board.cells[random_cell]
      computer_guess.fire_upon
      return computer_guess
    else 
      puts "Something went wrong" 
    end    
  end 

  def render_guess_status(guess)
    if guess == "M"
      return "miss"
    elsif guess == "H"
      return "hit"
    elsif guess ==  "X"
      return "sunk"
    end 
   end 
 
  def display_results(player_guess, computer_guess)
    player_rendered_guess = render_guess_status(player_guess.render)
    computer_rendered_guess = render_guess_status(computer_guess.render)
    puts "The players guess of #{player_guess.cell } is #{player_guess.render} "
    puts "The computer' guess of #{computer_guess.cell} is #{computer_guess.render}" 
  end

  def execute 
    display_boards
    player_move = player_turn
    computer_move = computer_turn
    display_results(player_move, computer_move)
  end
end 
