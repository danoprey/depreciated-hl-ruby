module Hyperledger
  class Issue
    def initialize(ledger, amount)
      @ledger = ledger
      @amount = amount
      @uuid = SecureRandom.uuid
    end
    
    def as_json(key)
      unsigned = {ledger: @ledger, amount: @amount, uuid: @uuid}
      sign = Base64.encode64 key.sign(OpenSSL::Digest::SHA256.new, unsigned.to_json)
      unsigned.merge(resource_signature: sign)
    end
  end
end