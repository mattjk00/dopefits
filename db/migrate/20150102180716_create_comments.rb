class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :poster
      t.references :fit, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :fits
  end
end
