require 'test_helper'

class PoolInterfaceTest < MiniTest::Test
  
  def setup
    stub_request(:any, /test\/*/)
    @interface = Hyperledger::PoolInterface.new('test')
  end
  
  def test_get_accounts
    @interface.accounts
    assert_requested :get, 'test/accounts'
  end
  
  def test_register_account
    account = Hyperledger::Account.new('ledger')
    account.stub :public_key, 'key' do
      @interface.register_account(account)
    end
    expected_body = {account: {ledger: 'ledger', public_key: 'key'}}
    assert_requested :post, 'test/accounts', body: expected_body
  end
  
  def test_get_ledgers
    @interface.ledgers
    assert_requested :get, 'test/ledgers'
  end
  
  def test_register_ledger
    ledger = Hyperledger::Ledger.new('name', 'url')
    ledger.stub :as_json, {name: 'name'} do
      @interface.register_ledger(ledger)
    end
    assert_requested :post, 'test/ledgers', body: {ledger: {name: 'name'}}
  end
  
  def test_issue
    @interface.issue('ledger', 100)
    assert_requested :post, 'test/issues', body: {issue: {ledger: 'ledger', amount: 100}}
  end
  
  def test_transfer
    @interface.transfer(100, 'source', 'destination')
    expected_body = {transfer: {amount: 100, source: 'source', destination: 'destination'}}
    assert_requested :post, 'test/transfers', body: expected_body
  end
  
end