class Post < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_attached_file :image, styles: {
    square: '200x200#',
    medium: '300x300>',
    large: '500x500>'
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
