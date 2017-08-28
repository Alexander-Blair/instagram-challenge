class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_attached_file :image, styles: {
    square: '200x200#',
    medium: '300x300>',
    large: '500x500>'
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.reverse_order
    all.reverse
  end
end
