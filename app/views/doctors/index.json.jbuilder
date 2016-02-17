json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :name, :hourly_rate, :hours_per_week
  json.url doctor_url(doctor, format: :json)
end
