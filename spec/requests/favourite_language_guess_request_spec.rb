require 'rails_helper'

RSpec.describe "favourite language guessing", type: :request do
  describe "GET /" do
    it "returns http success" do
      get '/'
      expect(response).to have_http_status(:success)
    end

    pending 'displays error alerts'
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

    it 'redirects with error if user doesnt exist' do
      allow(FetchPublicReposByUsername).to receive(:call) { raise GithubApiErrors::NotFoundError }
      get '/guess', params: { username: 'johny' }

      expect(response).to redirect_to '/'
      expect(flash.alert).to be_present
    end

    it 'redirects with an alert if github throws too many requests error' do
      allow(FetchPublicReposByUsername).to receive(:call) { raise GithubApiErrors::TooManyRequestsError }
      get '/guess', params: { username: 'johny' }

      expect(response).to redirect_to '/'
      expect(flash.alert).to be_present
    end
  end
end
