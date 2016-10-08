class CreateAnswerJobs < ActiveRecord::Migration
  def change
    create_table :answer_jobs do |t|
      t.string :position
      t.string :domain
      t.string :cpy_name
      t.string :cpy_location
      t.string :cpy_domain
      t.datetime :start
      t.datetime :finish
      t.string :time
      t.text :activities
      t.text :achievements
      t.timestamps null: false
    end
  add_reference :answer_jobs, :resume, type: :uuid, index: true
  end
end
