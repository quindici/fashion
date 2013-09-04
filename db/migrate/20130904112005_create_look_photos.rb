class CreateLookPhotos < ActiveRecord::Migration
  def change
    create_table :look_photos do |t|
      t.string :description
      t.integer :look_id

      t.timestamps
    end
  end
end
