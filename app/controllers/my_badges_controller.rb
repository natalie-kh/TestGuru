class MyBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_badges = current_user.badges.includes(:user_badges).order('user_badges.created_at desc')
  end

end