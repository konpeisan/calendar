require 'rails_helper'

describe BudgetsController, type: :request do
  before do
    @budget = FactoryBot.create(:budget)
  end

  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #analysis' do
    it 'analysisアクションにリクエストすると正常にレスポンスが返ってくる' do
      get analysis_budgets_path
      expect(response.status).to eq 200
    end
    it 'analysisアクションにリクエストするとレスポンスに登録済みの収支が存在する' do
      get analysis_budgets_path
      expect(response.body).to include('全収支')
    end
  end
end
