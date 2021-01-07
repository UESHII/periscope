class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :clear, null: false
      t.text :dark, null: false
      t.references :user, index: true, null: false
      t.references :evaluation, index: true, null: false
      t.timestamps
    end
  end
end
