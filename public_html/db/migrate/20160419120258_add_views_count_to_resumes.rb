class AddViewsCountToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :views_count, :integer, default: 0
  end
end
