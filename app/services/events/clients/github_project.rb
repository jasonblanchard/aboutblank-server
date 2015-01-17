module Events
  module Clients
    class GithubProject

      def events
        Octokit.user.rels[:repos].get.data
      end

    end
  end
end
