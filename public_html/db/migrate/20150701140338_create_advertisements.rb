class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.belongs_to :company
      t.string     :title
      t.text       :body
      t.string     :type
      t.boolean    :visible, :default => true
      t.integer    :views,   :default => 0
      t.datetime   :deadline
      t.timestamps null: false
    end
  end
end
