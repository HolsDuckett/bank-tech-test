require 'bank_account'

describe 'Bank Account' do

  let (:account) {BankAccount.new}
  let (:statement_header) { "date || credit || debit || balance" }
  let (:date) {"08/03/2021"}

  describe '#print_statament' do

    it 'should print out a customers bank statement' do
      expect(account.print_statement).to eq(statement_header)
    end

  end

  describe '#deposit' do

    it "should increase balance by desposit amount" do
      expect{ account.deposit(100, date) }.to change{ account.balance }.by(100)
    end

    it "should add the current transaction to the transaction history" do
      transaction = account.deposit(100, date)
      expect(account.transaction_history).to match(transaction)
    end

  end

  describe '#withdraw' do

    it 'should decrease the balance by withdrawal amount' do
      expect{ account.withdraw(100, date) }.to change{ account.balance }.by(-100)
    end

  end


end
