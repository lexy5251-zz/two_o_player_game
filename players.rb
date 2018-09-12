class Player

  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 3
  end

  def dead?
   @score == 0

  end


  def take_score(amount)
    @score -= amount
  end


end
