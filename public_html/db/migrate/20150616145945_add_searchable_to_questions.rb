class AddSearchableToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :searchable, :boolean, :default => false
  end
end
