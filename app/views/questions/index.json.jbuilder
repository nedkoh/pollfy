json.array!(@questions) do |question|
  json.extract! question, :title, :qtype, :desc, :answer, :definition, :require, :validate, :page, :order, :created_at, :updated_at, :survey_id, :user_id
  json.url question_url(question, format: :json)
end
