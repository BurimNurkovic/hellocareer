class CreateAnswerCompetitions < ActiveRecord::Migration
  def change
    create_table :answer_competitions do |t|
      t.belongs_to :resume
      t.string :name
      t.string :comp_type
      t.datetime :organized_at
      t.text :prizes
      t.timestamps null: false
    end
  end
end
