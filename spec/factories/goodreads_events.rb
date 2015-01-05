FactoryGirl.define do
  factory :goodreads_event do
    sequence(:uuid, 1)
    happened_at "2015-01-05"
    image_url "http://example.com/image"
    url "http://example.com/great-book"
    title "great book"
  end

end
