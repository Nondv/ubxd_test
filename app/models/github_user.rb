# frozen_string_literal: true

# Just a wrapper over user data from octokit
# similar to `GithubRepo`
class GithubUser
  def initialize(octokit_resource)
    @octokit_resource = octokit_resource
  end

  delegate :name,
           :avatar_url,
           :bio,
           to: :octokit_resource

  def username
    octokit_resource.login
  end

  def to_h
    methods = %i[name avatar_url bio username]
    methods.each_with_object({}) do |method, res|
      res[method] = send(method)
    end
  end

  private

  attr_reader :octokit_resource
end
