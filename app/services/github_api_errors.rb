# frozen_string_literal: true

module GithubApiErrors
  class NotFoundError < StandardError; end
  class TooManyRequestsError < StandardError; end

  def map_octokit_error(octokit_error)
    case octokit_error
    when Octokit::NotFound then NotFoundError
    when Octokit::TooManyRequests then TooManyRequestsError
    end
  end
end
