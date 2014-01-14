require 'spec_helper'

  describe Mention do
    it "can archive a mention" do
      mention = Mention.create
      mention.archived.should eq(false)
      mention.send_to_archived
      mention.archived.should eq(true)
    end

    it "can retrieve both archived and unarchived mentions", :vcr do
      user = FactoryGirl.build(:user, name: "jsl_demo_07")
      fetcher = TweetFetcher.new(user)
      mention = FactoryGirl.build(:mention, user_id: user.id)
      mentions = Mention.get_unarchived_mentions_for(user)
      mentions.should include("@weesie_b This is a Tweet")
    end
  end
