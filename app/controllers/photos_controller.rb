class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new photo_params
    if @photo.save
      redirect_to photo_path, notice: "Photo created."
    else
    end
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:photo_url,description,hashtag)
  end
  
end
