class BankAccount

  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def print_statement
    "date || credit || debit || balance"
  end

  def deposit(amount, date)
    @balance += amount
    @transaction_history << {date: date, debit: amount}
  end

  def withdraw(amount, date)
    @balance -= amount
  end


end
