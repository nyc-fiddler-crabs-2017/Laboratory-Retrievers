class CreateProdecures < ActiveRecord::Migration[5.0]
  def change
    create_table :prodecures do |t|
      t.text :body, null: false
      t.integer :step, null: false
      t.references :experiment, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
