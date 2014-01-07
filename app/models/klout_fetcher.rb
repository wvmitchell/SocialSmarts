class KloutFetcher

  BASE_URL = "http://api.klout.com/v2/"

  def get_score_information_for(user)
    response = Faraday.get(BASE_URL + "identity.json/twitter?screenName=#{user}&key=#{ENV['KLOUT_KEY']}")
    id = JSON.parse(response.body)["id"]
    second_response = Faraday.get(BASE_URL + "user.json/#{id}/score?key=#{ENV['KLOUT_KEY']}")
    JSON.parse(second_response.body)
  end

  def get_score_for(user)
    info = get_score_information_for(user)
    info["score"]
  end

end
