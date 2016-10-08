class CreateAnswerProfessionalSchools < ActiveRecord::Migration
  def change
    create_table :answer_professional_schools do |t|
      t.string :inst_name
      t.string :inst_location
      t.string :speciality
      t.datetime :start
      t.datetime :finish
      t.timestamps null: false
    end
    add_reference :answer_professional_schools, :resume, type: :uuid, index: true
  end
end
