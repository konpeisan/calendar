require 'rails_helper'

RSpec.describe "Halls", type: :request do
  describe "GET /halls" do
    it "works! (now write some real specs)" do
      get halls_index_path
      expect(response).to have_http_status(200)
    end
  end
end
