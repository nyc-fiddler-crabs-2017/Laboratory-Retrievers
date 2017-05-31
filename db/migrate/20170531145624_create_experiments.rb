class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.string :title, null: false
      t.text :result
      t.text :conclusion
      t.string :status, null: false, default: "Open"
      t.references :experiment_proposal, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
