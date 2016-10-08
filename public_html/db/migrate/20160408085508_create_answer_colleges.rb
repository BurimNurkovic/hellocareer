class CreateAnswerColleges < ActiveRecord::Migration
  def change
    create_table :answer_colleges do |t|
      t.string :inst_name
      t.string :inst_location
      t.string :speciality
      t.datetime :start
      t.datetime :finish
      t.timestamps null: false
    end
    add_reference :answer_colleges, :resume, type: :uuid, index: true
  end
end
