require 'spec_helper'

describe "dashboard index" do

  before do
    user = FactoryGirl.build(:user)
    FactoryGirl.create(:mention)
    Mention.stub(:add_tweets_for)
    login_user(user)
    visit login_path
    click_on "Sign in with Twitter"
  end

  it "views mentions" do
    expect(page).to have_content 'This is a Tweet'
  end

  it "flags mentions" do
    page.first(".flag a").click
    (Mention.first.flagged).should eq(true)
  end

  it "archives mentions" do
    page.first(".archive a").click
    expect(page).to_not have_content 'This is a Tweet'
  end

  xit "retweets mentions" do
    FactoryGirl.create(:mention)
    FactoryGirl.create(:mention)

    visit login_path
    click_on "Sign in with Twitter"
  end

end
