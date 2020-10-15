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
      redirect_to photos_path, notice: "Photo created."
    else
      render :new 
    end
  end
  
  def show
    @photo = Photo.find params[:id]
  end  
  
  def edit
    @photo = Photo.find params[:id]
  end
  
  def update 
    @photo = Photo.find params[:id]
    if @photo.update photo_params
      redirect_to @photo, notice: "Photo updated."
    else
      render :edit
    end
  end
  
  private
  
  def photo_params
    params.require(:photo).permit(:photo_url,:description,:hashtag)
  end
  
end
