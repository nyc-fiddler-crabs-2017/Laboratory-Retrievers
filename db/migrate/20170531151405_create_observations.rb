class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.text :body, null: false
      t.references :observable, polymorphic: true, index: true
      t.references :user, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
