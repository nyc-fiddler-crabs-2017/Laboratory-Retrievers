class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.reference :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
