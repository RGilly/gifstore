class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.string :title
      t.text :categories

      t.timestamps null: false
    end
  end
end
