require 'httparty'
require 'JSON'

class RecordCheck < ActiveRecord::Base
  attr_accessor :FirstName, :LastName, :MiddleName, :Address, :City, :State, :Zip, :County, :DOB, :AgeMin, :AgeMax, :Limit, :ExactMatch


#will get response from api for micheal vick
  def getRecords
  @options = {
    :credentials => {
      :account_id => "128003",
      :api_key => "kJrz2U9LCuGNcwRJZrN9rTyrfQ"
    },
    :product => "criminal_database",
    :data => {
    :FirstName => params[:firstName],
    :LastName => params[:lastName],
    :MiddleName => params[:middleName],
    :Address => params[:address],
    :City => params[:city],
    :State => params[:state],
    :Zip => params[:zip],
    :County => params[:county],
    :DOB => params[:DOB],
    :AgeMin => 0,
    :AgeMax => 120,
    :Limit => 1,
    :ExactMatch => "yes"
  }
  }



  @opt = JSON.generate(options)
  @url = 'https://api.imsasllc.com/v3/'
  @response = HTTParty.post(url, body: opt, :headers => {'Content-Type' => 'application/json' })
  @parsed = JSON.parse(response.body)
  @saved = @parsed.save
  p @parsed
  p @saved
  end



  #Generates aproval code and saves it to a variable TODO: include this variable in the DB
def generate_approval_code(size = 9)
  charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
  @code = (0...size).map{ charset.to_a[rand(charset.size)] }.join
end


  def approval_check
    #returns the Description
     a = ApiCall.new.getRecords
     a.extend Hashie::Extensions::DeepFind
    deeper = a.deep_find(:Description)
    if deeper.include? "ANIMAL"  #asks if animal is included
      puts "Not approved"
      # redirect_to rejection_path
    else
      puts "approved"
      # redirect_to approval_path
    end
  end

  def show

  end

  def new
    @check = RecordCheck.new
  end


end
