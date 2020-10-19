class User < ApplicationRecord
    has_many :projects
    validates_presence_of(:firstname)
    validates_presence_of(:lastname)
    validates_presence_of(:email) 
    validates_presence_of(:password)
    before_save { self.email = email.downcase }
    
end
