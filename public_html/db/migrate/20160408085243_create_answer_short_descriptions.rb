class CreateAnswerShortDescriptions < ActiveRecord::Migration
  def change
    create_table :answer_short_descriptions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone
      t.string :blog
      t.text :summary
      t.timestamps null: false
    end
    add_reference :answer_short_descriptions, :resume, type: :uuid, index: true
  end
end
