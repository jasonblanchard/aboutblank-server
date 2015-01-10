class DeliciousEventSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :happened_at, :url, :title, :image_url
end
