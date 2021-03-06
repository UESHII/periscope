class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :contact, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :team_id, index: true, null: false
      t.date :joining_date, null: false
      t.timestamps
    end
  end
end
