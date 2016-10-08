class CreateContentBoxes < ActiveRecord::Migration
  def change
    create_table :content_boxes do |t|
      t.string :key
      t.string :title
      t.text   :body
      t.string :image

      t.timestamps null: false
    end
  end
end
