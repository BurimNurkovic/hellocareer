class DropPersonals < ActiveRecord::Migration
  def change
    drop_table :answer_personals if ActiveRecord::Base.connection.table_exists? 'answer_personals'
  end
end
