class API::V1::MentionsController < ApplicationController
  respond_to :json
  def index
    respond_with Mention.limit(10).order("created_at DESC")
  end

  def show
    respond_with Mention.find(params[:id])
  end
end
