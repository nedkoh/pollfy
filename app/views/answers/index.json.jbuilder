json.array!(@answers) do |answer|
  json.extract! answer, :answer, :response, :survey_id, :question_id, :user_id
  json.url answer_url(answer, format: :json)
end
