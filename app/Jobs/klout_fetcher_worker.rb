class KloutFetcherWorker

  @queue = :klout_fetch


  def self.perform(mention_id)
    mention = Mention.find(mention_id)
    mention.update_klout
    sleep(1)
  end

end
