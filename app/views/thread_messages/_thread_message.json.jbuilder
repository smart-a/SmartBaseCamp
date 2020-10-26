json.extract! thread_message, :id, :thread_id, :tm_content, :created_at, :updated_at
json.url thread_message_url(thread_message, format: :json)
