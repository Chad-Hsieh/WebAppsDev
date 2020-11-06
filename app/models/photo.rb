class Photo < ApplicationRecord
    has_many :comments 
    belongs_to :user
    
    validates :photo_url, presence: true #for validation
end
