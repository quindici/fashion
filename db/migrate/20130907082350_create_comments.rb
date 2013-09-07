class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :score
      t.text :text

      t.timestamps
    end
  end
end
