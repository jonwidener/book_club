class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.integer :number
      t.string :title
      t.text :synopsis
      t.string :book_id, foreign_key: true

      t.timestamps
    end

    add_index :chapters, [:number, :book_id], unique: true
  end
end
