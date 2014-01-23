class KloutFetcherWorker

  @queue = :klout_fetch


  def self.perform(mention_id)
    mentions = Mention.where(mention_id:, mention_id)
    mentions.each do |mention|
      mention.update_klout
      sleep(1)
    end
  end

end
