class TopicsController < ApplicationController

  respond_to :html, :json
  
  before_filter :find_topic, :except => ['index', 'new', 'create']
  before_filter :find_posts, :except => ['index', 'new', 'create']
  
  def index
    @topics = Topic.all
    #This of course needs to be fixed
  end
  
  def show
    respond_with @topic
  end
  
  def new
    @topic = Topic.new
    @topic.subforum_id = params[:subforum_id]

    respond_with @topic
  end
  
  def create
    @topic = Topic.new(params[:topic])
    @topic.user_id = current_user.id
    if @topic.save
      flash[:notice] = "Successfully created topic."
      respond_with @topic, :location => new_post_path
    else
      flash[:alert] = "Failed to create topic."
      render :action => :new
    end
  end
  
  def edit
    respond_with @topic
  end
  
  def update
    if @topic.update_attributes(params[:topic])
      flash[:notice] = "Successfully updated topic."
      respond_with @topic, :location => topics_path
    else
      flash[:alert] = "Failed to update topic."
      render :action => :edit
    end
  end
  
  def destroy
    flash[:notice] = 'Successfully removed topic.' if @topic.delete
    respond_with @topic
  end
  
  private
  
  def find_topic
    @topic = Topic.find(params[:id])
  end
  
  def find_posts
    @posts = @topic.posts
  end
  
end
