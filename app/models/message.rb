class Message < ApplicationRecord
    belongs_to :user
    belongs_to :app_thread
    has_many :messages, :dependent => :delete_all
end
