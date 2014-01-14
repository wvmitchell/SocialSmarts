Rails.application.config.middleware.use OmniAuth::Builder do
  # if Rails.env.production?
  #   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # else
    provider :twitter, 'YSeuV5nQGiBDbtKbrWKdQ', 'uupuj4BI1hcjIK0cYOt5TKVqUjrSRNrRy4uMTHqxhc'
  # end
end

