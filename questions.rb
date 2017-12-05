class Question

  def initialize
    @variable_1 = rand(1-20) + 1
    @variable_2 = rand(1-20) + 1
    @answer = @variable_1 + @variable_2
  end

  attr_reader :variable_1, :variable_2, :answer

end
