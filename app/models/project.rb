class Project < ApplicationRecord
    belongs_to :user
    has_many :app_threads, :dependent => :delete_all
    # has_many :messages

    validates :title, presence: :true
    validates :description, presence: :true
end
