set :output, "#{path}/log/cron.log"

every 2.minutes do
  rake "social_smarts:enqueue_m_fetcher_worker"
end

every 1.minute do
  rake "social_smarts:enqueue_f_fetcher_worker"
end
