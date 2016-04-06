class CriminalCheckController < ApplicationController
    def checker(data)
    @account_id = '127999'
    @api_key = 'oVuiZ6gfhwT41MoBJDMUyS6y4B'
    @product = 'federal_criminal'
    @url = 'https://api.imsasllc.com/v3/ '
    @data = data[
      @firstName = firstName,
      @lastName = lastName,
      @middleName = middleName,
      @limit = limit
    ]

    response =  HTTParty.get(@url)
    @parsed = JSON.parse(response)


    #submit and get a result

    @result = HTTParty.post(@url, :body => {:subject => 'This is the screen name', :issue_type => 'Application Problem', :status => 'Open', :priority => 'Normal', :description => 'This is the description for the problem'})
    end


#     curl -d
# '{
#   "credentials": {
#       "account_id": "123456",
#       "api_key": "EGi5e7caJioM49lOXMANJZCoum"
#   },
#   "product": "federal_criminal",
#   "data": {
#       "FirstName": "Jack",
#       "LastName": "Graham",
#       "MiddleName": "A",
#       "Limit": 25
#   }
# }' https://api.imsasllc.com/v3/


    def curl
      require 'uri'
      require 'net/http'

      url = URI("https://api.imsasllc.com/v3/")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE



      request = Net::HTTP::Post.new(url)
      credentials = {"account_id" => "127999",
                      "api_key" => "oVuiZ6gfhwT41MoBJDMUyS6y4B" }

      product = "federal_criminal"

      data = {
              "FirstName" => "#{firstName}",
              "lastName" => "#{lastName}",
              "middleName" => "#{middleName}",
              "limit" => "#{limit}"
      }

      response = http.request(request)
      puts response.read_body
    end

end
