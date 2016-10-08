class AddUuidToAnswerBlocks < ActiveRecord::Migration
  def up
    # remove_column :answer_competences, :resume_id
    # add_reference :answer_competences, :resume, type: :uuid, index: true

    remove_column :answer_competitions, :resume_id
    add_reference :answer_competitions, :resume, type: :uuid, index: true

    remove_column :answer_courses, :resume_id
    add_reference :answer_courses, :resume, type: :uuid, index: true

    remove_column :answer_hobbies, :resume_id
    add_reference :answer_hobbies, :resume, type: :uuid, index: true

    remove_column :answer_language_competences, :resume_id
    add_reference :answer_language_competences, :resume, type: :uuid, index: true

    # remove_column :answer_peri_post_licenses, :resume_id
    # add_reference :answer_peri_post_licenses, :resume, type: :uuid, index: true

    # remove_column :answer_personals, :resume_id
    # add_reference :answer_personals, :resume, type: :uuid, index: true

    remove_column :answer_positions, :resume_id
    add_reference :answer_positions, :resume, type: :uuid, index: true

    # remove_column :answer_pre_licenses, :resume_id
    # add_reference :answer_pre_licenses, :resume, type: :uuid, index: true

    remove_column :answer_qualifications, :resume_id
    add_reference :answer_qualifications, :resume, type: :uuid, index: true

    remove_column :answer_volunteerings, :resume_id
    add_reference :answer_volunteerings, :resume, type: :uuid, index: true

    # remove_column :answer_works, :resume_id
    # add_reference :answer_works, :resume, type: :uuid, index: true
  end

  def down
    # remove_reference :answer_competences, :resume
    # add_column :answer_competences, :resume_id, :integer

    remove_reference :answer_competitions, :resume
    add_column :answer_competitions, :resume_id, :integer

    remove_reference :answer_courses, :resume
    add_column :answer_courses, :resume_id, :integer

    remove_reference :answer_hobbies, :resume
    add_column :answer_hobbies, :resume_id, :integer

    remove_reference :answer_language_competences, :resume
    add_column :answer_language_competences, :resume_id, :integer

    # remove_reference :answer_peri_post_licenses, :resume
    # add_column :answer_peri_post_licenses, :resume_id, :integer

    # remove_reference :answer_personals, :resume
    # add_column :answer_personals, :resume_id, :integer

    remove_reference :answer_positions, :resume
    add_column :answer_positions, :resume_id, :integer

    # remove_reference :answer_pre_licenses, :resume
    # add_column :answer_pre_licenses, :resume_id, :integer

    remove_reference :answer_qualifications, :resume
    add_column :answer_qualifications, :resume_id, :integer

    remove_reference :answer_volunteerings, :resume
    add_column :answer_volunteerings, :resume_id, :integer

    # remove_reference :answer_works, :resume
    # add_column :answer_works, :resume_id, :integer
  end
end
