class CreateSearchOccurrences < ActiveRecord::Migration
  def change
    create_table :search_occurrences do |t|
      t.belongs_to :user
      t.string :key
      t.string :value
      t.integer :count, :default => 0
      t.timestamps null: false
    end
  end
end
