class ChangeDefaultUserTypeOnUsers < ActiveRecord::Migration[5.1]

  def change
    create_table :users do |t|
      t.integer :permission_type, default: 1
    end
  end

end
