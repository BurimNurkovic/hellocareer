class CreateAnswerQualifications < ActiveRecord::Migration
  def change
    create_table :answer_qualifications do |t|
      t.belongs_to :resume
      t.text :description
      t.string :domain
      t.string :certified_by
      t.datetime :certified_at
      t.timestamps null: false
    end
  end
end
