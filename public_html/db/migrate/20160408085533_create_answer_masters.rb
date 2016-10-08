class CreateAnswerMasters < ActiveRecord::Migration
  def change
    create_table :answer_masters do |t|
      t.string :inst_name
      t.string :inst_country
      t.string :speciality
      t.string :domain
      t.string :faculty
      t.datetime :start
      t.datetime :finish
      t.timestamps null: false
    end
    add_reference :answer_masters, :resume, type: :uuid, index: true
  end
end
