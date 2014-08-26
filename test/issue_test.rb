require 'test_helper'

class IssueTest < MiniTest::Test
  
  def setup
    @issue = Hyperledger::Issue.new('test', 100)
  end
  
  def test_as_json
    key = OpenSSL::PKey::RSA.new(2048)
    assert_equal [:ledger, :amount, :uuid, :resource_signature], @issue.as_json(key).keys
  end
end