class Photo < ApplicationRecord
    has_many :comments 
    belongs_to :user
    
    mount_uploader :photo_url, FileUploader
    
    validates :photo_url, presence: true #for validation
    
    
    def self.search(params)
        photos = Photo.where("description LIKE ? or hashtag LIKE ?", "%#{params[:search]}%",
                "%#{params[:search]}%") if params[:search].present? 
        photos
    end
end
