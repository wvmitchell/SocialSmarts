class KloutFetcherWorker

  @queue = :klout_fetch

  def self.perform(mention_id)
    mentions = Mention.where(mention_id: mention_id)
    kf = KloutFetcher.new
    mentions.each do |m|
      m.klout = kf.get_score_for(m.username)
      m.save
      sleep(1)
    end
  end

end
