class CreateAnswerVolunteerings < ActiveRecord::Migration
  def change
    create_table :answer_volunteerings do |t|
      t.belongs_to :resume
      t.string :name
      t.string :volunteering_type
      t.string :role_type
      t.string :org_role
      t.datetime :start
      t.datetime :finish
      t.string :time
      t.text :responsibilities
      t.text :achievements
      t.timestamps null: false
    end
  end
end
