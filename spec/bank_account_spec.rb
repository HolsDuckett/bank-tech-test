require 'bank_account'
require 'Date'

describe 'Bank Account' do

  let (:account) {BankAccount.new}
  let (:statement_header) { "date || credit || debit || balance" }
  let (:todays_date) {Date.today}

  describe '#print_statament' do

    it 'should print out a customers bank statement' do
      expect(account.print_statement).to eq(statement_header)
    end

  end

  describe '#deposit' do

    it "should increase balance by desposit amount" do
      expect{ account.deposit(100) }.to change{ account.balance }.by(100)
    end
    

  end


end
