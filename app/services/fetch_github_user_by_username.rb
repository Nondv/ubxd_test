# frozen_string_literal: true

# `GithubUser`
class FetchGithubUserByUsername
  include GithubApiErrors

  def self.call(username, client = Octokit::Client.new)
    new(client).call(username)
  end

  def initialize(client)
    @client = client
  end

  def call(username)
    GithubUser.new(client.user(username))
  rescue StandardError => e
    raise(map_octokit_error(e) || e)
  end

  private

  attr_reader :client
end
