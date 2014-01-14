require 'spec_helper'

describe "dashboard index" do

  it "views mentions" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:mention, user: user)
    Mention.stub(:add_tweets_for)
    login_user(user)
    visit login_path
    click_on "Sign in with Twitter"
    expect(page).to have_content 'Inbox'
  end

  xit "archives mentions" do
    FactoryGirl.create(:mention)
    visit login_path
    click_on "Sign in with Twitter"
    expect(page).to have_content 'This is a Tweet'
    click_on "Archive"
    expect(page).to_not have_content 'This is a Tweet'
  end

  it "retweets mentions" do 
    FactoryGirl.create(:mention)
    FactoryGirl.create(:mention)

    visit login_path
    click_on "Sign in with Twitter"
  end
end
