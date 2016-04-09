require 'httparty'
require 'JSON'

class ApiCall


# def initialize
#   @opt = opt
#   @url = url
#   @response = response
#   @parsed = parsed
#   @flatter = flatter
# end
public

def flatten_hash(hash)
  hash.each_with_object({}) do |(k, v), h|
    if v.is_a? Hash
      flatten_hash(v).map do |h_k, h_v|
        h["#{k}.#{h_k}".to_sym] = h_v
      end
    else
      h[k] = v
    end
   end
end


def getRecords
options = {
  :credentials => {
    :account_id => "128002",
    :api_key => "PMl0NrA0O8N7ObSQXI5PJBJraC"
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
@@parsed = JSON.parse(@response.body)
 p @flatter = flatten_hash(@@parsed)
 puts "Abuser" if  @flatter["Results"] == "ANIMALS"
 puts "after find crime"

end

def find_all_values_for(key)
  result = []
  result << self[key]
  self.values.each do |hash_value|
    values = [hash_value] unless hash_value.is_a? Array
    values.each do |value|
      result += value.find_all_values_for(key) if value.is_a? Hash
    end
  end
  result.compact
end


end




 a = ApiCall.new
puts a.getRecords
p a.find_all_values_for(:"Results")
