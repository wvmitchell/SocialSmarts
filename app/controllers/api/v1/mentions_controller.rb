class API::V1::MentionsController < ApplicationController
  respond_to :json
  def index
    respond_with Mention.limit(5).order("created_at DESC")
  end

  def send_to_archived
    respond_with Mention.archived = true
  end

  def archive_index
    
  end
end
