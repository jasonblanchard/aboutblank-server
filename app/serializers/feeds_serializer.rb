class FeedsSerializer < ActiveModel::Serializer
  embed :id, include: true
  attributes :id
  has_many :goodreads_events, :delicious_events

  def id
    1
  end

  def goodreads_events
    GoodreadsEvent.recent
  end

  def delicious_events
    DeliciousEvent.recent
  end
end
