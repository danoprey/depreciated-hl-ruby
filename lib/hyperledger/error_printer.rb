module Hyperledger
  class DataPrinter
    
    def initalise(json_string)
      @data = JSON.parse(json_string, symbolize_names: true)
    end
    
    def print_error
      puts "Error: #{err}"
      errors = @data[:errors]
      if errors
        errors.each do |k, v| puts "#{k}:\t#{v.join(', ')}" end
      end
    end
    
  end
end
