require 'httparty'
require 'JSON'
options = {
  :credentials => {
    :account_id => "127993",
    :api_key => "3M1Dp0VtKL8HEAtSX7MM2P0Xid"
  },
  :product => "criminal_database",
  :data => {
  :FirstName => "Willie",
  :LastName => "Hicks",
  :MiddleName => "A",
  :Address => "3301 BELMONT BLVD",
  :City => "Chicago",
  :State => "IL",
  :Zip => "34232",
  :County => "Cook",
  :DOB => "1964-12-16",
  :AgeMin => 60,
  :AgeMax => 70,
  :Limit => 1,
  :ExactMatch => "no"
}
}
opt = JSON.generate(options)
url = 'https://api.imsasllc.com/v3/'
response = HTTParty.post(url, body: opt, :headers => {'Content-Type' => 'application/json' })
parsed = JSON.parse(response.body)
p parsed
