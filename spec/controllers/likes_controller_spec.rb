require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let!(:example_post) { create(:valid_post) }
  let!(:example_like) { create(:valid_like) }
  let(:valid_like_params) { { like: { user_id: example_post.user.id,
                                      post_id: example_post.id } } }
  let(:invalid_like_params) { { like: { post_id: example_post.id } } }

  before do
    sign_in(example_post.user)
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Like" do
        expect {
          post :create, params: valid_like_params
        }.to change{ Like.count }.by(1)
      end

      it "redirects to the home page" do
        post :create, params: valid_like_params
        expect(response).to redirect_to(posts_url)
      end
    end

    context "with invalid params" do
      it "does not create new like" do
        expect {
          post :create, params: invalid_like_params
        }.to change(Like, :count).by(0)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested like" do
      expect {
        delete :destroy, params: { id: example_like.id }
      }.to change(Like, :count).by(-1)
    end

    it "redirects to home" do
      delete :destroy, params: { id: example_like.id }
      expect(response).to redirect_to(posts_url)
    end
  end
end
