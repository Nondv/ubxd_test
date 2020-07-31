class FavouriteLanguageGuessController < ApplicationController
  def index
  end

  def show
    username = params[:username].presence
    return redirect_to('/') unless username

    repos = FetchPublicReposByUsername.call(username)
    language = GuessFavouriteLanguage.call(repos)
    github_user = FetchGithubUserByUsername.call(username)

    render :show, locals: { language: language,
                            username: username,
                            github_user: github_user.to_h }
  rescue GithubApiErrors::NotFoundError
    flash.alert = "User #{username} not found"
    redirect_to('/')
  rescue GithubApiErrors::TooManyRequestsError
    flash.alert = 'Github API request limit exceeded by the server'
    redirect_to('/')
  end
end
