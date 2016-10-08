class CreateAnswerCourses < ActiveRecord::Migration
  def change
    create_table :answer_courses do |t|
      t.belongs_to :resume
      t.text :description
      t.string :duration
      t.datetime :start
      t.string :tutoring_party
      t.timestamps null: false
    end
  end
end
