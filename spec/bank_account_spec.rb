require 'bank_account'

describe 'Bank Account' do

  let (:account) {BankAccount.new}
  let (:statement_header) { "date || credit || debit || balance" }

  it 'should print out a customers bank statement' do
    expect(account.print_statement).to eq(statement_header)
  end


end
