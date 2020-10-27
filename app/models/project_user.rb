class ProjectUser < ApplicationRecord
    belongs_to :project
    has_many :users
    validates_uniqueness_of(:user_id, scope: :project_id)
    
end
