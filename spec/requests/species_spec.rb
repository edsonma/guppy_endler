require 'rails_helper'

RSpec.describe "Species", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/species/index"
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /show" do
    it "returns http success" do
      get "/species/show"
      expect(response).to have_http_status(:success)
    end
  end

end
