class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.timestamps null: false
    end
  end
end
