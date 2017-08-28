require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:valid_post) { build(:valid_post) }
  let!(:invalid_post) { build(:invalid_post) }

  it "should be valid" do
    expect(valid_post).to be_valid
  end

  it "is not valid without a user" do
    expect(invalid_post).not_to be_valid
  end

end
