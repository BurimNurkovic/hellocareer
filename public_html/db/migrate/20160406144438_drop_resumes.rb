class DropResumes < ActiveRecord::Migration
  def change
    drop_table :resumes if ActiveRecord::Base.connection.table_exists? 'resumes'
  end
end
