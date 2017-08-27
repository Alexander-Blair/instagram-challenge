require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { build(:valid_user) }
  let(:invalid_user) { build(:invalid_user) }

  it "should be valid" do
    expect(valid_user).to be_valid
  end

  it "doesn't allow password below six characters" do
    expect(invalid_user).not_to be_valid
  end
end
