json.array!(@record_checks) do |record_check|
  json.extract! record_check, :id
  json.url record_check_url(record_check, format: :json)
end
