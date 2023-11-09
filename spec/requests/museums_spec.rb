require 'rails_helper'

RSpec.describe "Museums", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/museums/index"
      expect(response).to have_http_status(:success)
    end
  end

end
