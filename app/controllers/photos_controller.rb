class PhotosController < ApplicationController
  before_action :load_photo, except: [:index, :new, :create]
  
  
  
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
  end  
  
  def edit
  end
  
  def update 
    if @photo.update photo_params
      redirect_to @photo, notice: "Photo updated." #notice is a blue box (find more info in application.html.erb)
    else
      render :edit
    end
  end
  
  def destroy
    @photo.destroy
    redirect_to photos_path, alert: "Photo deleted." #alert is a red box
  end
  
  
  private
  
  def load_photo
    @photo = Photo.find params[:id]
  end
  
  def photo_params
    params.require(:photo).permit(:photo_url,:description,:hashtag)
  end
  
end
