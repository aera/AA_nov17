json.array! @questions  do |question|
  json.id question.id
  json.title question.title.titleize
  # You can define any custom key for you json
  # response. The line below will add the key "stuff"
  # with the value "carrot" to JSON object that is returned.
  # json.stuff "carrot"
  json.created_at question.created_at.to_formatted_s(:db)
  json.updated_at question.updated_at.to_formatted_s(:db)

  # To create objects, specify a field `json.<field_name>`
  # then pass it a block and define all its properties
  # inside as below:
  json.author do
    json.id question.user.id
    json.first_name question.user.first_name
    json.last_name question.user.last_name
    json.full_name question.user.full_name
  end
end
