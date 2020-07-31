# frozen_string_literal: true

# Just a wrapper over a resource from octokit.
# It defines a specific interface for the app to interact with.
class GithubRepo
  def initialize(octokit_resource)
    @octokit_resource = octokit_resource
  end

  delegate :language,
           :name,
           to: :octokit_resource

  private

  attr_reader :octokit_resource
end
