class CreateTermsChapters < ActiveRecord::Migration
  def change
    create_table :terms_chapters do |t|
      t.integer :chapter_nr
      t.string  :title
      t.text    :body
      t.timestamps null: false
    end
  end
end
