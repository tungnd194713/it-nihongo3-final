class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :book_img, style: { book_index: "250x350>", book_show: "325x475>" }, default_url: "https://t4.ftcdn.net/jpg/00/89/55/15/360_F_89551596_LdHAZRwz3i4EM4J0NHNHy2hEUYDfXc0j.jpg"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
end