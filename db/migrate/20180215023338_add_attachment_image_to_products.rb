class AddAttachmentImageToProducts < ActiveRecord::Migration[5.0]
  def up
    change_table :products do |t|
      t.attachment :image
    end
  end

  def down
    remove_attachment :products, :image
  end
end
