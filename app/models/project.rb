class Project < ApplicationRecord
    belongs_to :user
    has_many :app_threads
    has_many :attachments
    validates :title, presence: :true
    validates :description, presence: :true
end
