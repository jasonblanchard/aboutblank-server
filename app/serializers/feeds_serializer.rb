class FeedsSerializer < ActiveModel::Serializer
  embed :id, include: true
  attributes :id
  has_many :goodreads_events, :delicious_events, :github_project_events, :github_star_events

  def id
    1
  end

  def goodreads_events
    GoodreadsEvent.recent
  end

  def delicious_events
    DeliciousEvent.recent
  end

  def github_project_events
    GithubProjectEvent.recent
  end

  def github_star_events
    GithubStarEvent.recent
  end
end
