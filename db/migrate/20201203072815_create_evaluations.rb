class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.text :goal, null: false
      t.text :result
      t.date :fiscal_year, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
