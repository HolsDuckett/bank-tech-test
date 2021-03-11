# frozen_string_literal: true

class BankAccount
  attr_reader :balance, :transaction_history

  HEADER = "date || credit || debit || balance\n"

  def initialize
    @balance = 0
    @transaction_history = []
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
    if @transaction_history.length.zero?
      'You havent done anything girl, theres nothing to see here.'
    else
      puts HEADER
      puts transactions_to_array_of_strings.join("\n")
    end
  end

  private # ---------------------------------------------------

  def transactions_to_array_of_strings
    transaction_list = []

    @transaction_history.reverse.each do |transaction|
      transaction_list << render_transactions(transaction)
    end

    transaction_list
  end

  def render_transactions(transaction)
    date = transaction[:date]
    amount = transaction[:amount]
    balance_at_time = transaction[:balance_at_time]

    if amount.positive?
      "#{date} || #{'%.2f'% amount} ||  || #{'%.2f' % balance_at_time}"
    else
      "#{date} ||  || #{'%.2f' % -amount} || #{'%.2f' % balance_at_time}"
    end
  end
end
