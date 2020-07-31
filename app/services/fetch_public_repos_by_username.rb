# frozen_string_literal: true

# returns a list of user's public repo and wraps them into `GithubRepo`
class FetchPublicReposByUsername
  include GithubApiErrors

  def self.call(username, client = Octokit::Client.new)
    new(client).call(username)
  end

  def initialize(client)
    @client = client
  end

  def call(username)
    client.repos(username).map { |r| GithubRepo.new(r) }
  rescue StandardError => e
    raise(map_octokit_error(e) || e)
  end

  private

  attr_reader :client
end
