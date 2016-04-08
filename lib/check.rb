require 'httparty'
require 'JSON'

class ApiCall

def getRecords
options = {
  :credentials => {
    :account_id => "127993",
    :api_key => "3M1Dp0VtKL8HEAtSX7MM2P0Xid"
  },
  :product => "criminal_database",
  :data => {
  :FirstName => "Michael",
  :LastName => "Vick",
  :MiddleName => "D",
  :Address => "",
  :City => "",
  :State => "Va",
  :Zip => "",
  :County => "",
  :DOB => "1980-06-26",
  :AgeMin => 0,
  :AgeMax => 70,
  :Limit => 1,
  :ExactMatch => "no"
}
}



@opt = JSON.generate(options)
@url = 'https://api.imsasllc.com/v3/'
@response = HTTParty.post(@url, body: @opt, :headers => {'Content-Type' => 'application/json' })
@parsed = JSON.parse(@response.body)
# p @parsed
end
end

puts a = ApiCall.new
puts a.getRecords
