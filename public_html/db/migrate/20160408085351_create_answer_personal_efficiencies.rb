class CreateAnswerPersonalEfficiencies < ActiveRecord::Migration
  def change
    create_table :answer_personal_efficiencies do |t|
      t.text :description
      t.integer :evaluation
      t.string :project
      t.timestamps null: false
    end
    add_reference :answer_personal_efficiencies, :resume, type: :uuid, index: true
  end
end
