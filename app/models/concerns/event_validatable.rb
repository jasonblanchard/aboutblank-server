module EventValidatable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :uuid
    validates_uniqueness_of :uuid
    validates_presence_of :title
    validates_presence_of :happened_at
    validates_presence_of :url

    scope :recent, lambda { order("happened_at DESC") }
  end

end
