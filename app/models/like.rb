class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def liked_by(user)
    self.user == user
  end

end
