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
    expect(page).to have_content 'This is a Tweet'
    page.first(".flag a").click
    (Mention.first.flagged).should eq(true)
    within('.sort_tab_names') do
      click_on "Flagged"
    end
    expect(page).to have_content 'This is a Tweet'
  end

  it "archives mentions" do
    expect(page).to have_content 'This is a Tweet'
    page.first(".archive a").click
    expect(page).to_not have_content 'This is a Tweet'
    within('.sort_tab_names') do
      click_on "Archived"
    end
    expect(page).to have_content 'This is a Tweet'
  end

end
