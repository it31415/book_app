class Circulation < ApplicationRecord
  validates :user_name, :book_name, :checkout_date, presence:true
  validates :user_name, length: { maximum: 50 }
  validates :book_name, length: { maximum: 200 }
end
