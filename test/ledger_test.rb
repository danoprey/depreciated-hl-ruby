require 'test_helper'

class LedgerTest < MiniTest::Test
  
  def setup
    @ledger = Hyperledger::Ledger.new('name', 'url')
  end
  
  def test_as_json_keys
    assert_equal [:name, :url, :public_key, :primary_account], @ledger.as_json.keys
  end
  
end