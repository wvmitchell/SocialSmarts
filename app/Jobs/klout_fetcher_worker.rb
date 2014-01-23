class KloutFetcherWorker

  @queue = :klout_fetch

  def self.perform(user_id)
    mentions = Mention.where(klout: nil, user_id: user_id)
    mentions.each do |mention|
      mention.update_klout
      sleep(1)
    end
  end

end
