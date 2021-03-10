# frozen_string_literal: true
# class Statement
#
#  HEADER = "date || credit || debit || balance\n"
#
#    def initialize(array)
#      @transaction_history = array
#    end
#
#   def transactions_to_array_of_strings
#     transaction_list = []
#
#     @transaction_history.reverse.each do |trans|
#       transaction_list << render_transactions(trans)
#     end
#
#     transaction_list
#   end
#
#   def render_transactions(trans)
#     date = trans[:date]
#     amount = trans[:amount]
#     balance_at_time = trans[:balance_at_time]
#
#     if amount.positive?
#       "#{date} || #{'%.2f' % amount} ||  || #{'%.2f' % balance_at_time}"
#     else
#       "#{date} ||  || #{'%.2f' % -amount} || #{'%.2f' % balance_at_time}"
#     end
#   end
#
#   def transactions?
#     @transaction_history.empty?
#   end
#
#   def statement_output
#     if no_transactions?
#       return 'You havent done anything girl, theres nothing to see here.'
#     else
#       puts HEADER
#       puts transactions_to_array_of_strings.join("\n")
#     end
#   end
#
# end
