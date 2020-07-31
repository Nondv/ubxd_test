require 'rails_helper'

RSpec.describe "favourite language guessing", type: :request do
  describe "GET /" do
    it "returns http success" do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /guess" do
    def mock_user_repos(username, repos)
      allow(FetchPublicReposByUsername).to receive(:call).with(username).and_return(repos)
    end

    it 'requires :username parameter and redirects if not present' do
      get '/guess'
      expect(response).to redirect_to '/'
    end

    it 'works fine with correct username provided' do
      mock_user_repos('johny', [])
      get '/guess', params: { username: 'johny' }
    end

    pending 'redirects with error if user doesnt exist'
    pending 'shows error when cant guess?'
  end
end
