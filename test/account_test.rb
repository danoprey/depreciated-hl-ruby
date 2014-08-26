require 'test_helper'

class AccountTest < MiniTest::Test
  
  def setup
    @account = Hyperledger::Account.new('ledger')
  end
  
  def test_as_json
    @account.stub :public_key, '123' do
      assert_equal({ledger: 'ledger', public_key: '123'}, @account.as_json)
    end
  end
  
end