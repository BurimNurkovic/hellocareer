class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :author
      t.text :text
      t.string :picture

      t.timestamps null: false
    end
  end
end
