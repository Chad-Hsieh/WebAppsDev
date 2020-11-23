class Photo < ApplicationRecord
    has_many :comments 
    belongs_to :user
    
    mount_uploader :photo_url, FileUploader
    
    validates :photo_url, presence: true #for validation
end
