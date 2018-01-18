class CreateWishlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists do |t|
      t.string :book_id
      t.boolean :read_or_not

      t.timestamps
    end
  end
end
