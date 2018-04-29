class AddImageToOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :image, :string
  end
end
