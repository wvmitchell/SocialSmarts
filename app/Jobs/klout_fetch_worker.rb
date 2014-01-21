class KloutFetchWorker

  @queue = :klout_fetch

  def self.perform(user_id)
    mentions = Mention.where(klout: nil, user_id: user_id)
    kf = KloutFetcher.new
    mentions.each do |m|
      m.klout = kf.get_score_for(m.username)
      m.save
      sleep(1)
    end
  end

end
