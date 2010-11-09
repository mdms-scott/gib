class PostsController < ApplicationController

  respond_to :html, :json
  
  before_filter :find_posts, :except => ['index', 'new', 'create']
  before_filter :authenticate_user!, :except => ['show']
  
  def index
    @posts = Post.all
    #This of course needs to be fixed
  end
  
  def show
    respond_with @post
  end
  
  def new
    @post = Post.new
    @post.topic_id = params[:topic_id]

    respond_with @post
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Successfully replied to topic."
      #respond_with @post, :location => topic_path(@post.topic)
      respond_with @topic, :location => topic_url(@post.topic)
    else
      flash[:alert] = "Failed to create post."
      render :action => :new
    end
  end
  
  def edit
    respond_with @post
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully edited post."
      respond_with @posts, :location => posts_path
    else
      flash[:alert] = "Failed to edit post."
      render :action => :edit
    end
  end
  
  def destroy
    flash[:notice] = 'Successfully removed post.' if @post.delete
    respond_with @post
  end
  
  private
  
  def find_post
    @post = Post.find(params[:id])
  end
  
end
