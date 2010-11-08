class SubforumsController < ApplicationController
  
  respond_to :html, :json
  
  def index
    @subforums = Subforum.all
  end
  
  def new
    @subforum = Subforum.new
    respond_with @subforum
  end
  
  def create
    @subforum = subforum.new(params[:subforum])
    if @playlist.save
      flash[:notice] = "Successfully created a new subforum."
      respond_with @subforum, :location => subforums_path
    else
      flash[:alert] = "Failed to create a new subforum."
      render :action => :new
    end
  end
  
end
