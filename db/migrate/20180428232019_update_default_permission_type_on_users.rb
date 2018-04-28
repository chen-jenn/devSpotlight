class UpdateDefaultPermissionTypeOnUsers < ActiveRecord::Migration[5.1]

  def change
    change_column :users, :permission_type, :integer, :default => 1
  end

end
