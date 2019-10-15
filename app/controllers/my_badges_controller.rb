class MyBadgesController < ApplicationController

  def index
    @my_badges = current_user.badges
  end

end