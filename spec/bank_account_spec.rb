require 'bank_account'

describe 'Bank Account' do

  let (:account) {BankAccount.new}
  let (:statement_header) { "date || credit || debit || balance" }
  let (:date) {Time.now.strftime('%d/%m/%Y')}

  describe '#print_statament' do

    it 'should print out a customers bank statement with a header' do
      expect(account.print_statement).to eq(statement_header)
    end

    # it 'should print out a customers transaction history' do
    #   transaction = {date: , credit: amount, debit: "" , balance: @balance }
    #   expect(account.print_statament).to ouput(transaction)
    # end


  end

  describe '#deposit' do

    it "should increase balance by desposit amount" do
      expect{ account.deposit(100) }.to change{ account.balance }.by(100)
    end

    it "should add the deposit transaction to the transaction history" do
      transaction = account.deposit(100)
      expect(account.transaction_history).to match(transaction)
    end

  end

  describe '#withdraw' do

    it 'should decrease the balance by withdrawal amount' do
      expect{ account.withdraw(100) }.to change{ account.balance }.by(-100)
    end

    it "should add the withdraw transaction to the transaction history" do
      transaction = account.withdraw(100)
      expect(account.transaction_history).to match(transaction)
    end

  end


end
