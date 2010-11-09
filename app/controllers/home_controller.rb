class HomeController < ApplicationController

  def index
    if user_signed_in? | admin_signed_in?
      @subforums = Subforum.all
    else
      @subforums = Subforum.where('is_private = ?', 0)
    end
  end

end
