require 'rails_helper'

RSpec.describe "favourite language guessing", type: :request do
  describe "GET /" do
    it "returns http success" do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /guess" do
    it "returns http success" do
      get '/guess'
      expect(response).to have_http_status(:success)
    end
  end
end
