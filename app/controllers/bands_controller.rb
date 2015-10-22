class BandsController < ApplicationController
  before_action do
    redirect_to new_session_url unless logged_in?
  end

  def index
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new band_params
    if @band.save
      redirect_to bands_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

private

  def band_params
    params.require(:band).permit(:band_name)
  end


end
