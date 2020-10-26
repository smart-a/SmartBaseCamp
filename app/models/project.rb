class Project < ApplicationRecord
    has_many :users
    has_many :app_threads
    has_many :project_users
    validates :title, presence: :true
    validates :description, presence: :true
end
