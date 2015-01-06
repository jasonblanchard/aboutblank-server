Figaro.require_keys("goodreads_api_key", "goodreads_api_secret")

Goodreads.configure(
  :api_key => ENV["goodreads_api_key"],
  :api_secret => ENV["goodreads_api_secret"]
)
