class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :event_name
      t.timestamp :date
      t.string :event_url
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
