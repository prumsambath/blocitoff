require 'rails_helper'

describe ListsController do
  describe 'GET #index' do
    before :each do
      @user = create(:user)
      @user.skip_confirmation!
      @user.save

      sign_in @user
    end

    it 'should show all lists' do
      first = create(:list, user: @user)
      second = create(:list, user: @user)

      get :index
      expect(assigns(:lists)).to match_array([first, second])
    end

    it 'should render :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before :each do
      @list = create(:list)
      get :show, id: @list
    end

    it 'should show the selected list' do
      expect(assigns(:list)).to eq(@list)
    end

    it { is_expected.to respond_with :ok }
    xit { is_expected.to respond_with_content_type :json }
  end

  describe 'POST #create' do
    it 'should create a new list of items' do
      expect {
        post :create, list: attributes_for(:list)
      }.to change(List, :count).by(1)

    end

    it 'should redirect to index page' do
      post :create, list: attributes_for(:list)
      expect(response).to redirect_to(lists_path)
    end
  end

  describe 'PATCH #update' do
    it 'should update List attribute with the new data' do
      list = create(:list)
      patch :update, id: list, list: attributes_for(:list, name: 'Programming to learn')
      list.reload
      expect(list.name).to eq('Programming to learn')
    end

    it 'should redirect to lists#index page' do
      list = create(:list)
      patch :update, id: list, list: attributes_for(:list, name: 'Programming to learn')
      expect(response).to redirect_to(lists_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete the list' do
      list = create(:list)
      expect {
        delete :destroy, id: list
      }.to change(List, :count).by(-1)
    end
  end
end
