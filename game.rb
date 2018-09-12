require_relative './players'

class Game

  def initialize
    @player1 = Player.new('Player1')
    @player2 = Player.new('Player2')
    @players = [@player1, @player2]
    @current_player = @player1
    @answer_player = @player2

  end

  def ask_question(answer_question)
    @a = rand(0..10)
    @b = rand(0..10)
    rand_questions

    answer1 = gets.chomp.to_i

    puts "> #{answer1}"
    real_answer = @a + @b

    if answer1 == real_answer
      puts "#{@current_player.name}: Yes! You are correct!"
      answer_question.take_score(0)
      puts "P1 #{@player1.score}/3 vs P2 #{@player2.score}/3"
       puts "----- NEW TURN -----"
    else
      puts "#{@current_player.name}: Serously? No!"
      answer_question.take_score(1)
      puts "P1 #{@player1.score}/3 vs P2 #{@player2.score}/3"
       puts "----- NEW TURN -----"
    end


  end

  def game_over?
    @players.any? {|p| p.dead?}
  end

  def rand_questions
    puts "#{@current_player.name} : what does #{@a} plus #{@b} equal?"
  end


  def run
    while (!game_over?)

      ask_question(@current_player)
     # puts "P1 #{@player1.score}/3 vs P2 #{@player2.score}/3"
      check_who_win
      change_players
      # puts "#{@current_player.name}"
    end
  end

  def check_who_win
    if @player1.score == 0 || @player2.score == 0
      if @player1.score != 0
        puts "#{@player1.name} wins with a score of #{@player1.score}/3"
       else
        puts "#{@player2.name} wins with a score of #{@player2.score}/3"
      end
    end
  end

  def change_players
    if @current_player == @player1
       @current_player = @player2
    else
      @current_player = @player1
    end
    #binding.pry
  end

end





