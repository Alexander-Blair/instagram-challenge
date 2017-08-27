require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:valid_comment) { build(:valid_comment) }
  let!(:invalid_comment) { build(:invalid_comment) }

  it "should be valid" do
    expect(valid_comment).to be_valid
  end

  it "is not valid without a post" do
    expect(invalid_comment).not_to be_valid
  end
end
