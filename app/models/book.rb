class Book < ApplicationRecord
  validates :book_title, presence: true
  validates :book_title, length: { maximum: 200 }
end
