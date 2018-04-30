class CreateImageAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :image_attachments do |t|
      t.references :image, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
