require 'spec_helper'

describe "dashboard index" do

  it "views mentions" do
    visit login_path
    click_on "Sign in with Twitter"
    expect(page).to have_content 'Inbox'
  end

  it "archives mentions" do
    visit login_path
    FactoryGirl.create(:mention)
    click_on "Sign in with Twitter"
    expect(page).to have_content 'This is a Tweet'
  end
end
