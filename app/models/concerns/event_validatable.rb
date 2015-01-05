module EventValidatable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :uuid
    validates_uniqueness_of :uuid
  end
end
