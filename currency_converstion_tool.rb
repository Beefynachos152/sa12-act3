require 'httparty'

API_KEY = '12284810fdc456f1422eefbc'

BASE_URL = 'https://v6.exchangerate-api.com/v6'

def get_exchange_rate(source_currency, target_currency)
  response = HTTParty.get("#{BASE_URL}/#{API_KEY}/latest/#{source_currency}")

  if response.code == 200
    exchange_rates = response.parsed_response['conversion_rates']
    return exchange_rates[target_currency]
  else
    raise "Failed to fetch exchange rate. Status code: #{response.code}"
  end
end

def convert_currency(amount, source_currency, target_currency)
  rate = get_exchange_rate(source_currency, target_currency)
    converted_amount = amount * rate
  return converted_amount
end

source_currency = 'USD'
target_currency = 'EUR'
amount = 100 

begin
  converted_amount = convert_currency(amount, source_currency, target_currency)
  puts "Converted #{amount} #{source_currency} to #{converted_amount.round(2)} #{target_currency}"
rescue => e
  puts "Error: #{e.message}"
end
