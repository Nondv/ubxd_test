class FavouriteLanguageGuessController < ApplicationController
  def index
  end

  def show
    username = params[:username].presence
    return redirect_to('/') unless username

    begin
      repos = FetchPublicReposByUsername.call(username)
    rescue FetchPublicReposByUsername::NotFoundError
      flash.alert = "User #{username} not found"
      return redirect_to('/')
    end
    language = GuessFavouriteLanguage.call(repos)
    github_user = FetchGithubUserByUsername.call(username)

    render :show, locals: { language: language,
                            username: username,
                            github_user: github_user.to_h }
  end
end
