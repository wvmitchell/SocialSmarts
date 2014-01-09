require 'spec_helper'

  describe Mention do
    it "can archive a mention" do
      mention = Mention.create
      mention.archived.should eq(false)
      mention.send_to_archived
      mention.archived.should eq(true)
    end
  end
