class FavouriteLanguageGuessController < ApplicationController
  def index
  end

  def show
    username = params[:username].presence
    return redirect_to('/') unless username

    repos = FetchPublicReposByUsername.call(username)
    language = GuessFavouriteLanguage.call(repos)

    render :show, locals: { language: language,
                            username: username }
  end
end
