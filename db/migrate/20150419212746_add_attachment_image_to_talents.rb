class AddAttachmentImageToTalents < ActiveRecord::Migration
  def self.up
    change_table :talents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :talents, :image
  end
end
