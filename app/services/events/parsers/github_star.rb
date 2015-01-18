module Events
  module Parsers
    class GithubStar < Events::Parsers::Base

      def fields_from(raw_event)
        event = NormalizedEvent.new

        event.uuid = raw_event.repo.id
        event.title = raw_event.repo.full_name
        event.happened_at = raw_event.starred_at
        event.url = raw_event.repo.html_url

        event
      end
    end
  end
end
