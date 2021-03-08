class BankAccount

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def print_statement
    "date || credit || debit || balance"
  end

  def deposit(amount)
    @balance += amount
  end


end
