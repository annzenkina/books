class CreateReadBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :read_books do |t|
      t.string :book_id

      t.timestamps
    end
  end
end
