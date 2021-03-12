
class Statement

  HEADER = "date || credit || debit || balance\n"

  def print(transaction_history)
      puts HEADER
      puts transactions_to_array_of_strings(transaction_history).join("\n")
    end

  def transactions_to_array_of_strings(transaction_history)
    transaction_list = []

    transaction_history.reverse.each do |transaction|
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
