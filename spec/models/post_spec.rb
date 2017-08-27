require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:valid_post) { build(:valid_post) }

  it "should be valid" do
    expect(valid_post).to be_valid
  end

end
