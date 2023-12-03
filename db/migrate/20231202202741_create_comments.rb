class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :key
      t.string :key_type
      t.string :author
      t.text :note

      t.timestamps
    end
  end
end
