class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :company
      t.string   :searchable_fields,  :array => true, :default => []
      t.string   :visible_fields,     :array => true, :default => []
      t.integer  :search_limit,                       :default => 0
      t.integer  :premium_points,                     :default => 0
      t.string   :premium_resume_ids, :array => true, :default => []
      t.boolean  :active,                             :default => false
      t.datetime :expires_at
      t.timestamps null: false
    end
  end
end
