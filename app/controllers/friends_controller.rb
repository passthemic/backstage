class FriendsController < ApplicationController
  def index
    @friends = User.all
  end
  def show
    @friend = User.find params[:id]
  end
end
