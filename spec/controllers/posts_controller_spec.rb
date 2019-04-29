require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET /new " do
    it "Responds with 200 🎮" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "Responds with 200 🎮" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "Creates a post 🌍" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET / 🎮" do
    it "Responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
