class CreateFits < ActiveRecord::Migration
  def change
    create_table :fits do |t|
      t.string :title
      t.string :imageurl
      t.string :description

      t.timestamps null: false
    end
  end
end
