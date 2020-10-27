class User < ApplicationRecord
    has_many :projects, :dependent => :delete_all
    has_many :app_threads, :dependent => :delete_all
    has_many :messages, :dependent => :delete_all
    has_many :project_users, :dependent => :delete_all

    validates_presence_of(:firstname)
    validates :firstname, length: {minimum: 5}
    validates_presence_of(:lastname)
    validates_presence_of(:email)
    validates_presence_of(:password)
    before_save { self.email = email.downcase }
    
end
