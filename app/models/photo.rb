class Photo < ApplicationRecord
    validates :photo_url, presence: true #for validation
end
