class PhotosController < ApplicationController
  before_action :authenticate
  before_action :load_photo, except: [:index, :new, :create]
  
  
  # GET, /photos
  def index
      @photos = current_user.photos
      
  end
  
  # GET, /photos/new
  def new
    @photo = Photo.new
  end
  
  #POST, /photos
  def create
    @photo = Photo.new photo_params
    @photo.user = current_user #assign the new photo to the current user
    if @photo.save
      redirect_to photos_path, notice: "Photo created."
    else
      render :new 
    end
  end
  
  # GET, /photos/:id
  def show
    @comment = Comment.new #for the nil:NilClass error
  end  
  
  # GET, /photos/:id/edit
  def edit
  end
  
  # PATCH/PUT, /photos/:id
  def update 
    if @photo.update photo_params
      redirect_to @photo, notice: "Photo updated." #notice is a blue box (find more info in application.html.erb)
    else
      render :edit
    end
  end
  
  #DELETE, photos/:id
  def destroy
    @photo.destroy
    redirect_to photos_path, alert: "Photo deleted." #alert is a red box
  end
  
  
  private
  
  def load_photo
    @photo = current_user.photos.find params[:id]
  end
  
  def photo_params
    params.require(:photo).permit(:photo_url,:description,:hashtag)
  end
  
end
