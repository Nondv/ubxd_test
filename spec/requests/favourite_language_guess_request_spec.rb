require 'rails_helper'

RSpec.describe "FavouriteLanguageGuesses", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/favourite_language_guess/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/favourite_language_guess/show"
      expect(response).to have_http_status(:success)
    end
  end

end
