class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes, id: :uuid do |t|
      t.belongs_to :user
      t.string :title
      t.integer :progress
      t.timestamps null: false
    end
  end
end
