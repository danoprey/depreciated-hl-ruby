module Hyperledger
  class Account
    
    def initialize(ledger)
      @ledger = ledger
    end
    
    def public_key
      key.public_key.to_pem
    end
    
    def as_json
      {ledger: @ledger, public_key: public_key}
    end
    
    def persist(path)
      open path, 'w' do |io| io.write key.to_pem end
    end
    
  private
    
    def key
      @key ||= OpenSSL::PKey::RSA.new(2048)
    end
    
  end
end