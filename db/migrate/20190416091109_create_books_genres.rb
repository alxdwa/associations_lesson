class CreateBooksGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :books_genres do |t|
      t.references :book, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
