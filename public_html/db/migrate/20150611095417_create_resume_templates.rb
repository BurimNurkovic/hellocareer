class CreateResumeTemplates < ActiveRecord::Migration
  def change
    create_table :resume_templates do |t|
      t.text :body_for_pdf
      t.text :body_for_html
      t.string :handler
      t.timestamps null: false
    end
  end
end
