json.array!(@learning_resource_comments) do |learning_resource_comment|
  json.extract! learning_resource_comment, :id, :learning_resource_id, :body, :user_id
  json.url learning_resource_comment_url(learning_resource_comment, format: :json)
end
