class CommentsController < ApplicationController
  before_action :authenticate
  before_action :load_photo
  before_action :load_comment, except: [:index, :new, :create]
  
  def index
    @comments = @photo.comments
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new comment_params
    @comment.photo = @photo
    if @photo.comments << @comment
      redirect_to photo_path(@photo), notice: "Comment created."
    else
      render :new
    end
  end
  
  
  def show
  end

  def edit
  end
  
  def update
    if @comment.update comment_params
      redirect_to [@photo], notice: "Comment updated."
    else
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to photo_path(@photo)
  end 
  
  private
  
  def load_photo
    @photo = Photo.find params[:photo_id] #/photos/54/comments
  end
  
  def load_comment
    @comment = @photo.comments.find params[:id]
  end
  
  def comment_params
    params.require(:comment).permit(:content,:time)
  end
end
