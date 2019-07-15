class CreateCirculations < ActiveRecord::Migration[5.1]
  def change
    create_table :circulations do |t|
      t.string :user_name
      t.string :book_title
      t.date :checkout_date
      t.date :return_date

      t.timestamps
    end
  end
end
