# frozen_string_literal: true

# `GithubUser`
class FetchGithubUserByUsername
  class NotFoundError < StandardError; end

  def self.call(username, client = Octokit::Client.new)
    new(client).call(username)
  end

  def initialize(client)
    @client = client
  end

  def call(username)
    GithubUser.new(client.user(username))
  rescue Octokit::NotFound
    raise NotFoundError
  end

  private

  attr_reader :client
end
