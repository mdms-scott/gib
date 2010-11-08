class HomeController < ApplicationController

  def index
    @subforums = Subforum.all
  end

end
