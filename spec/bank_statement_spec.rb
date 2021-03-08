require 'bank_statement'

describe 'Bank statemant' do

  let (:statement) {BankStatement.new}
  let (:statement_header) { "date || credit || debit || balance" }

  it 'should print out a customers bank statement' do
    expect(statement.print).to eq(statement_header)
  end

end
