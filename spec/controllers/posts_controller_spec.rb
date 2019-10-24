require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index view successfully' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'renders the post successfully' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
  end
end
