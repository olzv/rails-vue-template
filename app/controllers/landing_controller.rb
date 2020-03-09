class LandingController < ApplicationController
  def index
    # respond_to do |format|
    #   format.all { render :nothing => true, :status => 200 }
    # end

    render html: '', layout: true
  end
end
