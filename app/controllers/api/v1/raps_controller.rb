class Api::V1::RapsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user!

  respond_to :json

  def index
    @raps = Rap.find_raps_created_by_or_invited_to(current_user)
  end

  def show
    @rap = Rap.find params[:id]
  end

  def create
    @rap = Rap.new params[:rap]
    if @rap.save
      @rap
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @rap.errors,
                        :data => {} }
    end
  end

  def update
    @rap = Rap.find params[:id]
    if @rap.update_attributes params[:rap]
      @rap
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @rap.errors,
                        :data => {} }
    end
  end

  def destroy
    @rap = Rap.find params[:id]
    @rap.destroy
    render :status => 200,
           :json => { :success => true,
                      :info => "rap: #{@rap.id} deleted",
                      :data => {} }
  end
end
