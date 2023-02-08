class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :book_img, style: { book_index: "250x350>", book_show: "325x475>" }, default_url: "https://d2j6dbq0eux0bg.cloudfront.net/images/24595415/1297476103.jpg"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
end