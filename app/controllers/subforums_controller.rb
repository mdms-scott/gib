class SubforumsController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_subforum, :except => ['index', 'new', 'create']
  
  def index
    @subforums = Subforum.all
  end
  
  def show
    respond_with @subforum
  end
  
  def new
    @subforum = Subforum.new
    respond_with @subforum
  end
  
  def create
    @subforum = Subforum.new(params[:subforum])
    if @subforum.save
      flash[:notice] = "Successfully created a new subforum."
      respond_with @subforum, :location => subforums_path
    else
      flash[:alert] = "Failed to create a new subforum."
      render :action => :new
    end
  end
  
  def edit
    respond_with @subforum
  end
  
  def update
    if @subforum.update_attributes(params[:subforum])
      flash[:notice] = "Successfully updated Subforum."
      respond_with @subforum, :location => subforums_path
    else
      flash[:alert] = "Failed to update Subforum."
      render :action => :edit
    end
  end
  
  def destroy
    flash[:notice] = 'Successfully removed subforum.' if @subforum.delete
    respond_with @subforum
  end
  
  private
  
  def find_subforum
    @subforum = Subforum.find(params[:id])
  end
  
end
