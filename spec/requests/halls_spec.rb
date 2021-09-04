require 'rails_helper'

describe HallsController, type: :request do
  before do
    @hall = FactoryBot.create(:hall)
  end

  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get halls_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに登録済みのホールが存在する' do 
      get halls_path
      expect(response.body).to include(@hall.store)
    end
  end
end
