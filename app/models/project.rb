class Project < ApplicationRecord
    belongs_to :user
    has_many :app_threads
    validates :title, presence: :true
    validates :description, presence: :true
end
