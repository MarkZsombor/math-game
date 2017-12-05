
class MathGame

  def self.main
    game = MathGame.new
    game.start
  end

  def initialize
    @players = [
      Player.new('Boy Band Guy'),
      Player.new('Winnipeg Guy')
    ]
    @current_player = 0
  end

  def current_player
    @players[@current_player]
  end

  def swap_players
    @current_player = (@current_player + 1) % @players.length
  end

  def start
    puts 'Do you want to play a game?'
    until game_over? do
      puts '*** NEW ROUND ***'
      puts "Are you ready #{current_player.name}?"
      q = Question.new
      puts "What is #{q.variable_1} + #{q.variable_2}?"
      if gets.chomp.to_i == q.answer
        puts 'You are smarter than you look'
      else
        lose_life
        puts "You are dumber than you look"
      end
      swap_players
      current_score
    end
    puts '*** GAME OVER ***'
    declare_winner
    puts 'You realize 2nd graders can do this right?'
  end

  def current_score
    puts "P1 #{@players[0].lives}/3 vs P2 #{@players[1].lives}/3"
  end

  def game_over?
    @players.any? { |player| player.lives == 0 }
  end

  def lose_life
    current_player.lose_life
  end

  def declare_winner
    if @players[0].lives == 0
      puts "#{@players[0].name} is the Winner"
    else
      puts "#{@players[1].name} is the Winner"
    end
  end

end
