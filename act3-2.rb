require 'httparty'

def fetch_exchange_rate(api_key, source_currency, target_currency)
  url = "https://v6.exchangeratesapi.io/latest?base=#{source_currency}&symbols=#{target_currency}&apikey=#{api_key}"
  response = HTTParty.get(url)
  exchange_data = JSON.parse(response.body)
  exchange_rate = exchange_data['rates'][target_currency]
  exchange_rate
end

def convert_currency(amount, exchange_rate)
  converted_amount = amount * exchange_rate
  converted_amount
end

# Example usage:
api_key = 'your_api_key'
source_currency = 'USD'
target_currency = 'EUR'
amount = 100
exchange_rate = fetch_exchange_rate(api_key, source_currency, target_currency)
converted_amount = convert_currency(amount, exchange_rate)
puts "#{amount} #{source_currency} is equal to #{converted_amount.round(2)} #{target_currency}"