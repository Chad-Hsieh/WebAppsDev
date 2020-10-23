class Comment < ApplicationRecord
    #Comment has foreign key: photo_id 
    belongs_to :photo #this line let the nodes know it belongs to a photo(model).
    
    validates :content, presence: true
end
