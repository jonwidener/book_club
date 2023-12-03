class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: false do |t|
      t.string :id, primary_key: true
      t.string :title
      t.string :author
      t.string :image_url
      t.text :synopsis

      t.timestamps
    end
  end
end
