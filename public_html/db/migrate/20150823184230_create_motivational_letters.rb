class CreateMotivationalLetters < ActiveRecord::Migration
  def change
    create_table :motivational_letters do |t|
      t.belongs_to :user

      t.text :about
      t.text :why_position
      t.text :why_company
      t.text :offer
      t.text :benefit
      t.text :request

      t.timestamps null: false
    end
  end
end
