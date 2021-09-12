require 'rails_helper'

describe TypesController, type: :request do
  before do
    @type = FactoryBot.create(:type)
  end

  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get types_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに登録済みの機種が存在する' do 
      get types_path
      expect(response.body).to include(@type.type_name)
    end
  end
end
