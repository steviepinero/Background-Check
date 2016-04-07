class CriminalCheckController < ApplicationController
    def initialize
@http = HTTParty.post("https://api.imsasllc.com/v3/", { :credentials {:account_id => "12799",
                                                        :api_key => "oVuiZ6gfhwT41MoBJDMUyS6y4B"},
                                                        :product => "federal_criminal",
                                                        :data {
                                                          :firstName => "jack",
                                                          :lastName  => "graham",
                                                          :middleName => "A",
                                                          :limit     => 25
                                                        },
                                                        })

    end


    def backgroundchecker
        require 'httparty'
        require 'JSON'
        ​
        options = {
          :credentials => {
            :account_id => "12799",
            :api_key => "oVuiZ6gfhwT41MoBJDMUyS6y4B"
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
          :Limit => 5,
          :ExactMatch => "no"
}
        }
        ​
        opt = JSON.generate(options)
        ​
        url = 'https://api.imsasllc.com/v3/'
        ​
        response = HTTParty.post(url, body: opt, :headers => {'Content-Type' => 'application/json' })
        ​
        parsed = JSON.parse(response.body)
        ​
        p parsed
    end


def check_params
    params.require(:user).permit(:firstname, :middleName, :lastName, :address, :city, :zip, :county, :dob, :limit, :exactMatch)
end

end
