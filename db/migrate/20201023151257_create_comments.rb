class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.datetime :time
      t.integer :photo_id

      t.timestamps
    end
  end
end
