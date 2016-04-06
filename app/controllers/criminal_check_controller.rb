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

end
