json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :money_amount
  json.url patient_url(patient, format: :json)
end
