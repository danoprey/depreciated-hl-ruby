module Hyperledger
  class Ledger
    
    def initialize(name, url)
      @name = name
      @url = url
    end
    
    def public_key
      key.public_key.to_pem
    end
    
    def primary_account
      @account ||= Account.new(@name)
    end
    
    def as_json
      {name: @name, url: @url, public_key: public_key,
       primary_account: {public_key: primary_account.public_key}}
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