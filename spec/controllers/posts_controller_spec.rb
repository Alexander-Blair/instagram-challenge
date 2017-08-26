require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:post_0) { create(:valid_post) }
  let(:image_file) { Rails.root.join('spec/fixtures/test_image.jpeg') }
  let(:upload_object) { fixture_file_upload(image_file, 'image/png') }
  let(:new_post_params) { { post: { description: "description",
                                    image: upload_object } } }

  describe "GET" do
    it "GET / returns status 200" do
      get :index
      expect(response).to have_http_status(200)
    end
    it "GET /new returns 200 status" do
      get :new
      expect(response).to have_http_status(200)
    end
    it "GET /post - single post" do
      get :show, params: { id: post_0.id }
      expect(response).to have_http_status(200)
    end
    it "GET edit post" do
      get :edit, params: { id: post_0.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST" do
    it "should create post" do
      post :create, params: new_post_params
      expect(response).to redirect_to post_url(Post.last)
    end
  end

  describe "UPDATE" do
    it "updates post successfully" do
      patch :update, params: { id: post_0.id, post: { description: "new description" } }
      expect(response).to redirect_to post_url(Post.last)
    end
  end

  describe "DESTROY" do
    it "deletes a post successfully" do
      expect{ delete :destroy, params: { id: post_0.id } }.to change{ Post.count }.by(-1)
      expect(response).to redirect_to(posts_url)
    end
  end
end
