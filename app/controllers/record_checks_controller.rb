class RecordChecksController < ApplicationController
  before_action :set_record_check, only: [:show, :edit, :update, :destroy]
  helper_method :getRecords


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



    @opt = JSON.generate(@options)
    @url = 'https://api.imsasllc.com/v3/'
    @response = HTTParty.post(@url, body: @opt, :headers => {'Content-Type' => 'application/json' })
    @parsed = JSON.parse(@response.body)

    p @parsed
    p @saved
    end

  def generate_approval_code(size = 9)
  charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
  (0...size).map{ charset.to_a[rand(charset.size)] }.join
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

  # GET /record_checks/new
  def new
    @record_check = RecordCheck.new
  end

  # GET /record_checks/1/edit
  def edit
  end

  # POST /record_checks
  # POST /record_checks.json
  def create
    @record_check = RecordCheck.new(record_check_params)

    respond_to do |format|
      if @record_check.save
        format.html { redirect_to @record_check, notice: 'Record check was successfully created.' }
        format.json { render :show, status: :created, location: @record_check }
      else
        format.html { render :new }
        format.json { render json: @record_check.errors, status: :unprocessable_entity }
      end
    end
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
