class AddIdsToComment < ActiveRecord::Migration
  def self.up
  	add_column :comments, :user_id, :integer
  	add_column :comments, :look_id, :integer

  	add_index :comments, :user_id
  	add_index :comments, :look_id
  end
  def self.down
  	remove_column :comments, :user_id, :integer
  	remove_column :comments, :look_id, :integer

  	remove_index :comments, :user_id
  	remove_index :comments, :look_id
  end
end
