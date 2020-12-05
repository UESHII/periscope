class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :contact, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :team_id, null: false
      t.date :joining_year, null: false
      t.timestamps
    end
  end
end
