require 'rest_client'
require 'json'

module Hyperledger
  class PoolInterface
    
    def initialize(root_url)
      headers = {content_type: 'application/json', accept: 'application/json'}
      @resource = RestClient::Resource.new(root_url, headers: headers)
    end
    
    def accounts
      response = @resource['accounts'].get
      JSON.parse(response.body, symbolize_names: true)
    end
    
    def register_account(account)
      @resource['accounts'].post({account: account.as_json}.to_json)
    end
    
    def ledgers
      @resource['ledgers'].get
    end
    
    def register_ledger(ledger)
      @resource['ledgers'].post({ledger: ledger.as_json}.to_json)
    end
    
    def issue(ledger, amount)
      issue = {issue: {ledger: 'ledger', amount: amount}}
      @resource['issues'].post issue.to_json
    end
    
    def transfer(amount, source, destination)
      transfer = {transfer: {amount: amount, source: source, destination: destination}}
      @resource['transfers'].post transfer.to_json
    end
    
  end
end