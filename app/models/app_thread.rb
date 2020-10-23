class AppThread < ApplicationRecord
    belongs_to :user
    belongs_to :project
    has_many :messages, :dependent => :delete_all

    validates :th_content, presence: :true
end
