# frozen_string_literal: true
# require 'statement'
#
# describe 'Statement' do
#   let(:statement) {Statement.new(["A","B","C"])}
#   # let(:statement_header) { "date || credit || debit || balance\n" }
#   # let(:date) { Time.now.strftime('%d/%m/%Y') }
#   # let(:transaction) { "#{date} || 100.00 ||  || 100.00\n" }
#
#   # describe '#print_statament' do
#   #   it 'should print out a customers transaction history including date, amount and balance at the time' do
#   #     expect { statement.print_statement }.to output(statement_header + ).to_stdout
#   #   end
#   #
#   #   it 'should raise error if no transactions have been made and user tries to print statment' do
#   #     expect(account.print_statement).to eq('You havent done anything girl, theres nothing to see here.')
#   #   end
#   # end
#
#   describe "#transactions?" do
#     it "returns true if there has been transactions" do
#       expect(statement.transactions?).to be(true)
#     end
#
#     it "returns false if there has been no transactions" do
#       statement = Statement.new([])
#       expect(statement.transactions?).to be(false)
#     end
#   end
#
# end
