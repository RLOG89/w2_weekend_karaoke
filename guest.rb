class Guest

  attr_accessor :money, :drinks_count
  attr_reader :name

  def initialize(name, money = 0, drinks_count = 0)
    @name = name
    @money = money
    @drinks_count = drinks_count
  end
  
end
