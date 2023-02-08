class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :review_replies
end
