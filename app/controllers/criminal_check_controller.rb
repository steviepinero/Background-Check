class CriminalCheckController < ApplicationController

    def getDetails

      @apiResponse = ApiCall.new
      @apiResponse.getRecords
    end

end
