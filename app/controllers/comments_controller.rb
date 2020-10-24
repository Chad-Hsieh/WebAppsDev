class CommentsController < ApplicationController
  before_action :load_photo
  
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
      redirect_to photo_comments_path(@photo), notice: "Comment created."
    else
      render :new
    end
  end
  
  
  def show
    @comment = @photo.commnets.find params[:id]
  end

  
  private
  
  def load_photo
    @photo = Photo.find params[:photo_id] #/photos/54/comments
  end
  
  def comment_params
    params.require(:comment).permit(:content,:time)
  end
end
