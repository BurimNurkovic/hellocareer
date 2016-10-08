class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.string :type
      t.integer :order_nr
      t.string :key
      t.string :category

      t.string :builder_text
      t.string :template_text
      t.string :tip_text
      t.json   :special_data

      t.timestamps null: false
    end
  end
end
