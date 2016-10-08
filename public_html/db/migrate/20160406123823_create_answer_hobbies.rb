class CreateAnswerHobbies < ActiveRecord::Migration
  def change
    create_table :answer_hobbies do |t|
      t.belongs_to :resume
      t.text :description
      t.timestamps null: false
    end
  end
end
