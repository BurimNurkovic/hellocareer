class RenameStagPostKeyInAnswerInternships < ActiveRecord::Migration
  def change
    rename_column :answer_internships, :stag_post_key, :stag_position_key
    rename_column :answer_internships, :stag_start_key, :start_start_key
  end
end
