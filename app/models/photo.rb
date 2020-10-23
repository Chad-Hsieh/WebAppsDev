class Photo < ApplicationRecord
    has_many :comments 
    
    validates :photo_url, presence: true #for validation
end
