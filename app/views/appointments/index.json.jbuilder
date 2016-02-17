json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :doctor, :patient_id, :appointment_date
  json.url appointment_url(appointment, format: :json)
end
