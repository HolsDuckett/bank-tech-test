require 'statement'

describe 'Statement' do
  context "#create a statement" do
    let(:statement_header) { "date || credit || debit || balance\n" }
    let(:date) { Date.new(1995, 10, 29).strftime('%d/%m/%Y') }
    let(:transaction_history) {[{ amount: 100, balance_at_time: 100, date: date.to_s }]}
    let(:transaction) { "#{date} || 100.00 ||  || 100.00\n" }
    let(:statement) {Statement.new}


    it 'should return a customers transaction history in the requested format' do
      allow(Date).to receive(:today).and_return(date)
      expect{ statement.print(transaction_history) }.to output(statement_header + transaction).to_stdout
    end

  end
end
