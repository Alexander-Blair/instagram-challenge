require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:valid_post) { create(:valid_post) }
  let!(:post_wrong_attachment) { build(:post_wrong_attachment) }

  it "should be valid" do
    expect(valid_post).to be_valid
  end

end
