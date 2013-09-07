class DeleteScoreFromComments < ActiveRecord::Migration
  def self.up
  	remove_column :comments, :score
  end

  def self.down
  	add_column :comments, :score, :integer
  end
end
