module Events
  module Clients
    class GithubStar

      def events
        Octokit.default_media_type = "application/vnd.github.v3.star+json"
        Octokit.user.rels[:starred].get.data
      end

    end
  end
end
