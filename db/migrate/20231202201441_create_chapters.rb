class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :synopsis
      t.string :book_id, foreign_key: true

      t.timestamps
    end
  end
end
