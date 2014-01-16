require 'spec_helper'

describe "dashboard index" do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  xit "views mentions" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:mention)
    Mention.stub(:add_tweets_for)
    login_user(user)
    visit login_path
    click_on "Sign in with Twitter"
    expect(page).to have_content 'Inbox'
  end

  it "flags mentions" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:mention)
    Mention.stub(:add_tweets_for)
    login_user(user)
    visit login_path
    click_on "Sign in with Twitter"
    expect(page).to have_content 'This is a Tweet'
  end

  xit "archives mentions" do
    FactoryGirl.create(:mention)
    visit login_path
    click_on "Sign in with Twitter"
    expect(page).to have_content 'This is a Tweet'
    click_on "Archive"
    expect(page).to_not have_content 'This is a Tweet'
  end

  xit "retweets mentions" do 
    FactoryGirl.create(:mention)
    FactoryGirl.create(:mention)

    visit login_path
    click_on "Sign in with Twitter"
  end

  xit "flags mentions" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:mention, user: user)
    login_user(user)
    visit login_path
    click_on "Sign in with Twitter"
    expect(page).to have_content 'This is a tweet'
  end
end
