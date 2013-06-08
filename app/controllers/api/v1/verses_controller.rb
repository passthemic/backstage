class Api::V1::VersesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  before_filter :authenticate_user!

  respond_to :json

  def index
    @verses = Rap.find(params[:rap_id]).verses
  end

  def show
    @verse = Verse.find(params[:id])
  end

  def create
    @verse = Verse.new params[:verse]
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
