set :output, "#{path}/log/cron.log"

every 2.minutes do
  runner "User.get_mentions_for_users"
end

every 1.minute do
  runner "Mention.get_klout_score_for_mentions"
end
