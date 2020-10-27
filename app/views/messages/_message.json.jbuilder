json.extract! message, :id, :thread, :created_at, :updated_at
json.url message_url(message, format: :json)
