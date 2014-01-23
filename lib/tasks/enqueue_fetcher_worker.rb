# namespace :social_smarts do
#   desc "gets mentions for each user"
#   task :enqueue_m_fetcher_worker do
#     Resque.enqueue(MentionFetcherWorker)
#     Rails.logger.info 'queue job'
#   end
#   desc "gets klout score for each user"
#   task :enqueue_k_fetcher_worker do
#     Resque.enqueue(KloutFetcherWorker)
#     Rails.logger.info 'queue job'
#   end
# end
