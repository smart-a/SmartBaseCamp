class ProjectUser < ApplicationRecord
    belongs_to :project
    has_many :users
    # 
    # validates_presence_of(:firstname )
    # validates_presence_of(:lastname )
    # validates_presence_of(:email)
    validates_uniqueness_of(:email)
    
end
