# frozen_string_literal: true

class GuessFavouriteLanguage
  def self.call(github_repos)
    new.call(github_repos)
  end

  def call(github_repos)
    return nil if github_repos.empty?

    github_repos
      .map(&:language)
      .compact
      .group_by(&:itself)
      .values
      .max_by(&:size)
      .first
  end
end
