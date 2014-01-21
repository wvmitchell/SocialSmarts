class API::V1::KloutController < ApplicationController
  respond_to :json
  
  def index
    respond_with KloutFetcher.new.get_score_information_for(params[:user])
  end
end
