require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:valid_like) { build(:valid_like) }
  let!(:invalid_like) { build(:invalid_like) }
  let!(:user) { create(:valid_user) }

  it "should be valid" do
    expect(valid_like).to be_valid
  end

  it "is not valid without a user" do
    expect(invalid_like).not_to be_valid
  end

  describe "#liked_by" do
    it "tells you if post has been liked by user" do
      expect(valid_like.liked_by(valid_like.user)).to eq(true)
    end
    it "tells you if post has not been liked by user" do
      expect(valid_like.liked_by(user)).to eq(false)
    end
  end
end
