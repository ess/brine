require 'brine/issue'

module Brine
  class ListingIssues
    FEATURE_LABELS = [
      'feature',
      'enhancement',
      'story',
      'use case',
      'use-case',
      'use_case',
      'user story',
      'user-story',
      'user_story'
    ].sort.map(&:downcase)

    def initialize(user, repo, github = Brine.github)
      @issues = github.issues.list(
        user: user,
        repo: repo,
        state: 'open'
      ).
      select {|issue|
        (
          FEATURE_LABELS & issue.labels.map {|label| label['name'].downcase}
        ).length != 0
      }.
      map {|issue| Brine::Issue.consume_api(issue)}.
      sort {|a,b| a.id <=> b.id}
    end

    def issues
      @issues
    end

    def summary
      issues.map(&:summary)
    end
  end
end
