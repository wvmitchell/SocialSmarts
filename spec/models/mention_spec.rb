require 'spec_helper'

  describe Mention do
    it "can archive a mention" do
      mention = Mention.create
      mention.archived.should eq(false)
      mention.send_to_archived
      mention.archived.should eq(true)
    end

    it "can retrieve both archived and unarchived mentions" do
      user = FactoryGirl.create(:user)
      mention = FactoryGirl.create(:mention, user_id: user.id)
      mentions = Mention.get_unarchived_mentions_for(user)
      mentions.should include(mention)
      mention.send_to_archived
      mentions = Mention.get_unarchived_mentions_for(user)
      mentions.should_not include(mention)
    end
  end
