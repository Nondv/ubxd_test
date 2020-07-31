# frozen_string_literal: true

# returns a list of user's public repo and wraps them into `GithubRepo`
class FetchPublicReposByUsername
  class NotFoundError < StandardError; end

  def self.call(username, client = Octokit::Client.new)
    new(client).call(username)
  end

  def initialize(client)
    @client = client
  end

  def call(username)
    client.repos(username).map { |r| GithubRepo.new(r) }
  rescue Octokit::NotFound
    raise NotFoundError
  end

  private

  attr_reader :client
end
