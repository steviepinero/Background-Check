class CriminalCheckController < ApplicationController

    def getDetails

      @apiResponse = ApiCall.new.getRecords
    end

end
