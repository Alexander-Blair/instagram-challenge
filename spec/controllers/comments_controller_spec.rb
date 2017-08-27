require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let!(:example_post) { create(:valid_post) }
  let!(:example_comment) { create(:valid_comment) }
  let(:valid_comment_params) { { comment: { content: "Hello, world!", post_id: example_post.id } } }
  let(:invalid_comment_params) { { comment: { content: "Hello, world!" } } }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: valid_comment_params
        }.to change{ Comment.count }.by(1)
      end

      it "redirects to the home page" do
        post :create, params: valid_comment_params
        expect(response).to redirect_to(posts_url)
      end
    end

    context "with invalid params" do
      it "does not create new comment" do
        expect {
          post :create, params: invalid_comment_params
        }.to change(Comment, :count).by(0)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      expect {
        delete :destroy, params: { id: example_comment.id }
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to home" do
      delete :destroy, params: { id: example_comment.id }
      expect(response).to redirect_to(posts_url)
    end
  end

end
