class Api::V1::VersesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user!

  respond_to :json

  def show
    @verse = Verse.find(params[:id])
  end

  def create
    if params[:verse][:rap_id].present?
      @rap = Rap.find params[:verse][:rap_id]
    else
      @rap = Rap.create params[:rap]
    end
    @verse = Verse.new params[:verse]
    @verse.rap_id = @rap.id
    if @verse.save
      @verse
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @verse.errors,
                        :data => {} }
    end
  end

  def destroy
    @verse = Verse.find params[:id]
    @verse.destroy
    render :status => 200,
           :json => { :success => true,
                      :info => "verse: #{@verse.id} deleted",
                      :data => {} }
  end
end
