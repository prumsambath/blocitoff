require 'rails_helper'

describe ItemsController do
  context 'with valid login' do
    describe 'GET #index' do
      it 'should list all active todo items only'

      it 'should show correct day left'
    end

    describe 'POST #create' do
      it 'should create a todo item'
    end

    describe 'PATH #edit' do
      it "should change item's attribute"
    end

    describe 'DELETE #destroy' do
      it 'should remove the item from the list'
    end
  end

  context 'without valid login' do
    describe 'GET #index' do
      it 'should require log in'
    end

    describe 'POST #create' do
      it 'should require log in'
    end

    describe 'PATCH #update' do
      it 'should require log in'
    end

    describe 'DELETE #destroy' do
      it 'should require log in'
    end
  end
end
