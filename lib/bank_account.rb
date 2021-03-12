# frozen_string_literal: true
require_relative 'statement'

class BankAccount
  attr_reader :balance, :transaction_history

  def initialize(statement = Statement)
    @balance = 0
    @transaction_history = []
    @statement = statement
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @balance += amount
    @transaction_history << { date: date, amount: amount, balance_at_time: @balance }
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    if @balance < amount
      'Insufficient funds - you gotta grind girl.'
    else
      @balance -= amount
      @transaction_history << { date: date, amount: -amount, balance_at_time: @balance }
    end
  end

  def print_statement
    if transaction_history.length.zero?
      'You havent done anything girl, theres nothing to see here.'
    else
      new_statement = @statement.new
      new_statement.print(@transaction_history)
    end
  end

end
