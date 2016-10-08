class CreateAnswerProfessionalCompetences < ActiveRecord::Migration
  def change
    create_table :answer_professional_competences do |t|
      t.text :description
      t.integer :evaluation
      t.string :project
      t.timestamps null: false
    end
    add_reference :answer_professional_competences, :resume, type: :uuid, index: true
  end
end
