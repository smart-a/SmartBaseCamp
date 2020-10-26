class User < ApplicationRecord
    has_many :projects
    has_many :project_users
    validates_presence_of(:firstname)
    validates :firstname, length: {minimum: 5}
    validates_presence_of(:lastname)
    validates_presence_of(:email)
    validates_uniqueness_of(:email)
    validates_presence_of(:password)
    before_save { self.email = email.downcase }
    
end
