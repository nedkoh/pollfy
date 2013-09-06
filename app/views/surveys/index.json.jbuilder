json.array!(@surveys) do |survey|
  json.extract! survey, :title, :created_at, :updated_at
  json.url survey_url(survey, format: :json)
end
