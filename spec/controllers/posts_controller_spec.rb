require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index view successfully' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'renders the post successfully' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('show')
    end
  end

  describe 'POST #create' do
    let(:params) { { post: { title: 'faketitle', body: 'fakebody'} } }

    context 'with valid params' do
      it 'creates a new post successfully' do
        expect { post :create, params: params }.to change(Post, :count).by 1
      end
    end
  end
end
