class RecordChecksController < ApplicationController

  def new
  @record_check = RecordCheck.new
  end

  def include?(other)
   self.merge(other) == self
  end


  def create
  @options = {
  :credentials => {
  :account_id => "128007",
  :api_key => "omy0WtdXc55LWUl48vjjklXuB4"
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
  p approval
  end

def approval
  @parsed.extend Hashie::Extensions::DeepFind
  @deeper = @parsed.deep_find(:Description)
     if @deeper.include?("ANIMAL") #asks if animal is included
  p @deeper
   @decision = "Not approved"
     else
  p @deeper
   @decision = "approved"
     end
end

new :approval, :after => :create

end
