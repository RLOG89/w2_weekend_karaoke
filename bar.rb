require_relative 'room'

class Bar < Room

  attr_reader :till_balance

  def initialize(name, till_balance)
    super(name)
    @till_balance = till_balance
  end

end