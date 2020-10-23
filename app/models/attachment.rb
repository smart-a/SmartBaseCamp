class Attachment < ApplicationRecord
    belongs_to :project
    mount_uploader :path, PathUploader
    validates :name, presence: :true
    validates :path, presence: :true
end
