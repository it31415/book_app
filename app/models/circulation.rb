class Circulation < ApplicationRecord
  validates :user_name, :book_title, :checkout_date, presence:true
  validates :user_name, length: { maximum: 50 }
  validates :book_title, length: { maximum: 200 }
end
