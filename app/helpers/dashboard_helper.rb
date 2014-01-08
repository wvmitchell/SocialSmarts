module DashboardHelper

  def display_klout_score(klout_fetcher, user)
    score = klout_fetcher.get_score_for(user.username)
    score ? score.round : 'n/a'
  end
end
