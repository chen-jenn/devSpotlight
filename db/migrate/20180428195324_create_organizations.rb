class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.integer :employee_count
      t.integer :tech_team_size
      t.text :address
      t.string :website_url
      t.string :twitter
      t.boolean :published

      t.timestamps
    end
  end
end
