class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_needed
    unless current_user
      render :json => {'error' => 'authentication error'}, :status => 401
    end
  end

end
