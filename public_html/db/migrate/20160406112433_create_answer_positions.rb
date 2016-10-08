class CreateAnswerPositions < ActiveRecord::Migration
  def change
    create_table :answer_positions do |t|
      t.belongs_to :resume
      t.string :domain
      t.string :position
      t.string :apply_at
      t.timestamps null: false
    end
  end
end
