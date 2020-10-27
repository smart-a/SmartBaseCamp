class ProjectUser < ApplicationRecord
    belongs_to :project
    validates_uniqueness_of(:user_id, scope: :project_id)
    
end
