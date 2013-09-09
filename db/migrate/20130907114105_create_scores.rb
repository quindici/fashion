class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score
      t.integer :user_id
      t.integer :look_id

      t.timestamps
    end
    add_index :scores, :user_id
    add_index :scores, :look_id
  end
end
