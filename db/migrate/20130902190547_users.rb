class Users < ActiveRecord::Migration
  def self.up
  	add_column :display_name, :string
  end

  def self.down
  	drop_column :display_name
  end
end
