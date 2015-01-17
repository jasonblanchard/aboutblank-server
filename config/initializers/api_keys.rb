Figaro.require_keys("goodreads_api_key", "goodreads_api_secret", "github_access_token")

Goodreads.configure(
  :api_key => ENV["goodreads_api_key"],
  :api_secret => ENV["goodreads_api_secret"]
)

Octokit.configure do |c|
  c.access_token = ENV['github_access_token']
end
