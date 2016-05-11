class RecordChecksController < ApplicationController
attr_accessor :first_name, :last_name, :middle_name, :address, :city, :state, :zip, :county, :dob, :approval_code
before_action :require_user, only: [:index, :show, :new]


  def new
  @record_check = RecordCheck.new
  end

  def include?(other)
   self.merge(other) == self
  end


  def create


  @options = {
  :credentials => {
  :account_id => "128021",
  :api_key => "7izYpgxSQrEvS6LtPiCInthKjk"
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



   @record_check = RecordCheck.new(record_check_params)

  # respond_to do |format|
  #   if @record_check.save
  #     format.html { redirect_to @record_check, notice: 'Record check was successfully created.' }
  #     format.json { render :show, status: :created, location: @record_check }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @record_check.errors, status: :unprocessable_entity }
  #   end
  # end


  end


  # def approval
  #   @parsed.extend Hashie::Extensions::DeepFind
  #   @deeper = @parsed.deep_find(:Description)
  #      if @deeper.to_s.include? "ANIMAL" #asks if animal is included
  #   p @deeper
  #    @decision = "Not approved"
  #    @approval_code = "not approved"
  #      redirect_to  :action => 'show'
  #      else
  #   p @deeper
  #    @decision = "approved"
  #    @approval_code = SecureRandom.hex(6)
  #    p @approval_code
  #
  #
  #      end
  # end




def index
  @record_check = RecordCheck.all
end

def show

end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_record_check
    @record_check = RecordCheck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def record_check_params
    params.require(:record_check).permit(:first_name, :middle_name, :last_name, :address, :city, :state, :zip, :county, :DOB, :ageMin, :ageMax, :limit, :exactMatch, :approval_code)
  end

end
