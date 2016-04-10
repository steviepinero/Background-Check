require 'httparty'
require 'JSON'
require 'hashie'

class ApiCall







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
  :LastName => "Vince",
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
@@parsed = JSON.parse(@response.body, :symbolize_names => true)
 # p @flatter = flatten_hash(@@parsed)
 # puts "Abuser" if  @flatter[:Results] == "ANIMALS"
 # puts "after find crime"

end




end



#returns the Description
 a = ApiCall.new.getRecords
 a.extend Hashie::Extensions::DeepFind
deeper = a.deep_find(:Description)
if deeper.include? "ANIMAL"  #asks if animal is included
  puts deeper
  puts "Not approved"
else
  puts deeper
  puts "approved"
end
