class CreateBookStores < ActiveRecord::Migration[5.1]
  def change
    create_table :book_stores do |t|
      t.string :title
      t.string :address

      t.timestamps
    end
  end
end
