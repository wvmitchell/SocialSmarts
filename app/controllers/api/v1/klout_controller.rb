class API::V1::KloutController < ApplicationController
  respond_to :json

  def index
    respond_with Mention.where(username: params[:user]).first.klout
  end

  def update_klout
    mention = Mention.where(username: params[:user]).first
    mention.klout = params[:score]
    mention.save
    respond_to do |format|
      if mention.save
        format.json { render json: mention, status: :created }
      else
        format.json { render json: mention.errors, status: :unprocessable_entity }
      end
    end
  end
end
