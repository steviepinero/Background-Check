require 'httparty'
require 'JSON'

class RecordCheck < ActiveRecord::Base
  attr_accessor :FirstName, :LastName, :MiddleName, :Address, :City, :State, :Zip, :County, :DOB, :AgeMin, :AgeMax, :Limit, :ExactMatch


#will get response from api for micheal vick
  def getRecords
  @options = {
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
  @response = HTTParty.post(url, body: opt, :headers => {'Content-Type' => 'application/json' })
  @parsed = JSON.parse(response.body)
  @saved = @parsed.save
  p @parsed
  p @saved
  end


  def show

  end

  def new
    @check = RecordCheck.new
  end


end
