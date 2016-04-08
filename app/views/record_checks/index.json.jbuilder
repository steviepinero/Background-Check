json.array!(@record_checks) do |record_check|
  json.extract! record_check, :id, :firstName, :middleName, :lastName, :address, :city, :state, :zip, :county, :DOB, :ageMin, :ageMax, :limit, :exactMatch
  json.url record_check_url(record_check, format: :json)
end
