require 'rails_helper'

describe ListsController do
  describe 'GET #index' do
    it 'should show all the lists' do
      first = create(:list)
      second = create(:list)

      get :index
      expect(assigns(:lists)).to match_array([first, second])
    end

    it 'should render :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'should show the selected list' do
      list = create(:list)
      get :show, id: list
      expect(assigns(:list)).to eq(list)
    end
  end

  describe 'POST #create' do
    it 'should create a new list of todos' do
      expect {
        post :create, list: attributes_for(:list)
      }.to change(List, :count).by(1)

    end

    it 'should redirect to index page' do
      post :create, list: attributes_for(:list)
      expect(response).to redirect_to(lists_path)
    end
  end
end
