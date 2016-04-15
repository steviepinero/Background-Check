class RecordChecksController < ApplicationController
  def new
    @record_check = RecordCheck.new
  end

  def create
    @options = {
    :credentials => {
    :account_id => "128003",
    :api_key => "	kJrz2U9LCuGNcwRJZrN9rTyrfQ	"
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

    def generate_approval_code(size = 9)
      charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
      @code = (0...size).map{ charset.to_a[rand(charset.size)] }.join
      @code.save
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


  # GET /record_checks
  # GET /record_checks.json
  def index
    @record_checks = RecordCheck.all
  end

  # GET /record_checks/1
  # GET /record_checks/1.json
  def show
  end

  # GET /record_checks/1/edit
  def edit
  end


  # PATCH/PUT /record_checks/1
  # PATCH/PUT /record_checks/1.json
  def update
    respond_to do |format|
      if @record_check.update(record_check_params)
        format.html { redirect_to @record_check, notice: 'Record check was successfully updated.' }
        format.json { render :show, status: :ok, location: @record_check }
      else
        format.html { render :edit }
        format.json { render json: @record_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_checks/1
  # DELETE /record_checks/1.json
  def destroy
    @record_check.destroy
    respond_to do |format|
      format.html { redirect_to record_checks_url, notice: 'Record check was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_check
      @record_check = RecordCheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_check_params
      params.require(:record_check).permit(:firstName, :middleName, :lastName, :address, :city, :state, :zip, :county, :DOB, :ageMin, :ageMax, :limit, :exactMatch)
    end
    #TODO use the params to send api request in controller
end
