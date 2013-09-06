class AddAttachmentPhotoToLookPhotos < ActiveRecord::Migration
  def self.up
    change_table :look_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :look_photos, :photo
  end
end
