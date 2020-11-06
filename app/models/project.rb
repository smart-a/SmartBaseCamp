class Project < ApplicationRecord
  belongs_to :user
  has_many :app_threads, :dependent => :delete_all
  has_many :attachments
  has_many :project_users
  has_many :tasks
  validates :title, presence: :true
  validates :description, presence: :true
end
