class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :photo_url
      t.string :description
      t.string :hashtag

      t.timestamps
    end
  end
end
