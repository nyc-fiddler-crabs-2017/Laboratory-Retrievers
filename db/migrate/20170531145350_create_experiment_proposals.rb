class CreateExperimentProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :experiment_proposals do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.text :hypothesis, null: false
      t.string :status, null: false, default: "Open"
      t.references :user, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
