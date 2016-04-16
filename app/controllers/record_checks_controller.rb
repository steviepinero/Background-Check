class RecordChecksController < ApplicationController
  def new
  @record_check = RecordCheck.new
  end

  def create
  @options = {
  :credentials => {
  :account_id => "128003",
  :api_key => "kJrz2U9LCuGNcwRJZrN9rTyrfQ"
  },
  :product => "criminal_database",
    :data => {
    :FirstName => params[:record_check][:first_name],
    :LastName => params[:record_check][:last_name],
    :MiddleName => params[:record_check][:middle_name],
    :Address => params[:record_check][:address],
    :City => params[:record_check][:city],
    :State => params[:record_check][:state],
    :Zip => params[:record_check][:zip],
    :County => params[:record_check][:county],
    :DOB => params[:record_check][:dob],
    :AgeMin => 0,
    :AgeMax => 120,
    :Limit => 1,
    :ExactMatch => "yes"
    }
}
@opt = JSON.generate(@options)
@url = 'https://api.imsasllc.com/v3/'
@response = HTTParty.post(@url, body: @opt, :headers => {'Content-Type' => 'application/json' })
@parsed = JSON.parse(@response.body)
#byebug
p @parsed

  end
def approval
  @parsed.extend Hashie::Extensions::DeepFind
  deeper = @parsed.deep_find(:Description)
     if deeper.count('ANIMAL') #asks if animal is included
  puts deeper
  puts"Not approved"
     else
  puts deeper
  puts "approved"
     end
end

end
