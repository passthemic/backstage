class Api::V1::FriendsController < ApplicationController
  def index
    @friends = User.all
  end
  def show
    @friend = User.find params[:id]
  end
end
