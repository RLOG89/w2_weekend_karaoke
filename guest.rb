class Guest

  attr_accessor :money
  attr_reader :name

  def initialize(name, money = 0)
    @name = name
    @money = money
  end
  
end
