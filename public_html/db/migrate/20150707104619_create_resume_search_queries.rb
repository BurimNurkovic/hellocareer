class CreateResumeSearchQueries < ActiveRecord::Migration
  def change
    create_table :resume_search_queries do |t|
      t.integer :data_hash, :limit => 8
      t.json    :data
      t.integer :count, :default => 1
    end
  end
end
