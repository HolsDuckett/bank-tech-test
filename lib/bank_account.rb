class BankAccount

  attr_reader :balance, :transaction_history

  HEADER = "date || credit || debit || balance"

  def initialize
    @balance = 0
    @transaction_history = []
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def print_statement
    transaction_array = [HEADER]
    transaction_history.reverse.each do |transaction|
       transaction_array << "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance_at_time]}"
     end
     transaction_array.join('\n')
  end

  def deposit(amount)
    @balance += amount
    @transaction_history << {date: @date, credit: amount, debit: "" , balance_at_time: @balance }
  end

  def withdraw(amount)
    @balance -= amount
    @transaction_history << {date: @date, credit: "", debit: amount , balance_at_time: @balance }
  end


end
