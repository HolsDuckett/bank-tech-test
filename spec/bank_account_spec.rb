require 'bank_account'

describe 'Bank Account' do

  let (:account) {BankAccount.new}
  let (:statement_header) { "date || credit || debit || balance\n" }
  let (:date) {Time.now.strftime('%d/%m/%Y')}
  let (:transaction) {"#{date} || 100.00 ||  || 100.00\n"}

  describe '#print_statament' do

    it 'should print out a customers transaction history including date, amount and balance at the time' do
      account.deposit(100)
      expect{account.print_statement}.to output(statement_header + transaction).to_stdout
    end

    it 'should state no transanction made if transactions history is empty' do
      expect(account.print_statement).to eq("No transactions made")
    end

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

  describe '#balance' do

    it 'should initialize balance equal to zero' do
      expect(account.balance).to eq(0)
    end

  end


end
