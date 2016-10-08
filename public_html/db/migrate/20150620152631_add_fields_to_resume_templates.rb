class AddFieldsToResumeTemplates < ActiveRecord::Migration
  def change
    add_column :resume_templates, :name, :string
    add_column :resume_templates, :description, :text
    add_column :resume_templates, :image, :string
  end
end
