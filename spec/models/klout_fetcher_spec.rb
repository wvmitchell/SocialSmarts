require 'spec_helper'

describe KloutFetcher do
  before(:each) do
    @fetcher = KloutFetcher.new
    @user = 'weesie_b'
  end

  it "returns a klout score informarion for a @user", :vcr do
    score_hash = @fetcher.get_score_information_for(@user)
    score_hash.keys.should include('score')
  end

  it "returns a klout score for a @user", :vcr do
    score = @fetcher.get_score_for(@user)
  end
end
