class CreateAnswerLanguageCompetences < ActiveRecord::Migration
  def change
    create_table :answer_language_competences do |t|
      t.belongs_to :resume
      t.string :language
      t.string :level
      t.timestamps null: false
    end
  end
end
