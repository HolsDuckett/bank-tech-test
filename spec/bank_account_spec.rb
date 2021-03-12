# frozen_string_literal: true
require 'bank_account'

describe 'Bank Account' do
  let(:account) { BankAccount.new }
  let(:statement_header) { "date || credit || debit || balance\n" }
  let(:date) { Date.new(1995, 10, 29)}
  let(:transaction) { "29/10/1995 || 100.00 ||  || 100.00\n" }
  let(:deposit) { { amount: 100, balance_at_time: 100, date: "29/10/1995" } }
  let(:withdraw) { { amount: -100, balance_at_time: 0, date: "29/10/1995" } }
  let(:transaction2) { "29/10/1995 ||  || 50.00 || 50.00\n29/10/1995 || 100.00 ||  || 100.00\n" }


  describe '#print_statament' do
    it 'should print out a customers transaction history including date, amount and balance at the time' do
      allow(Date).to receive(:today).and_return(date)
      account.deposit(100)
      expect { account.print_statement }.to output(statement_header + transaction).to_stdout
    end

    it 'should print out a customers transaction history including date, amount and balance at the time with both a deposit and withdrawl' do
      allow(Date).to receive(:today).and_return(date)
      account.deposit(100)
      account.withdraw(50)
      expect { account.print_statement }.to output(statement_header + transaction2).to_stdout
    end

    it 'should raise error if no transactions have been made and user tries to print statment' do
      expect(account.print_statement).to eq('You havent done anything girl, theres nothing to see here.')
    end
  end

  describe '#deposit' do
    it 'should increase balance by desposit amount' do
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end

    it 'should add the deposit transaction to the transaction history' do
      allow(Date).to receive(:today).and_return(date)
      account.deposit(100)
      expect(account.transaction_history[0]).to eq(deposit)
    end
  end

  describe '#withdraw' do
    it 'should decrease the balance by withdrawal amount' do
      account.deposit(100)
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end

    it 'should add the withdraw transaction to the transaction history' do
      allow(Date).to receive(:today).and_return(date)
      account.deposit(100)
      account.withdraw(100)
      expect(account.transaction_history[1]).to match(withdraw)
    end

    it 'should raise error if you have insufficient funds' do
      expect(account.withdraw(10)).to eq('Insufficient funds - you gotta grind girl.')
    end
  end

  describe '#balance' do
    it 'should initialize balance equal to zero' do
      expect(account.balance).to eq(0)
    end
  end

end
