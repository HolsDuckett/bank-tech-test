# frozen_string_literal: true
require_relative 'statement'
require 'time'

class BankAccount
  attr_reader :balance, :transaction_history

  def initialize(statement = Statement)
    @balance = 0
    @transaction_history = []
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << { date: date, amount: amount, balance_at_time: @balance }
  #  return "You have just deposited £#{amount}.00 into your bank account."
  end

  def withdraw(amount)
    if @balance < amount
      'Insufficient funds - you gotta grind girl.'
    else
      @balance -= amount
      @transaction_history << { date: date, amount: -amount, balance_at_time: @balance }
    #  return "You have just withdrawn £#{amount}.00 from your bank account."
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

  def date
    Date.today.strftime("%d/%m/%Y")
  end

end
