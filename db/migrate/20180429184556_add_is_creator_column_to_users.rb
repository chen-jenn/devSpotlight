class AddIsCreatorColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_creator, :boolean
  end
end
