class RenameColumnsToMatchPreviousCodebase < ActiveRecord::Migration
  def change
    rename_column :answer_positions, :domain, :pos_domain_key
    rename_column :answer_positions, :position, :pos_position_key
    rename_column :answer_positions, :apply_at, :pos_apply_key

    rename_column :answer_short_descriptions, :first_name, :about_name_key
    rename_column :answer_short_descriptions, :last_name, :about_surname_key
    rename_column :answer_short_descriptions, :email, :about_email_key
    rename_column :answer_short_descriptions, :address, :about_live_key
    rename_column :answer_short_descriptions, :phone, :about_tel_key
    rename_column :answer_short_descriptions, :blog, :about_blog_key
    rename_column :answer_short_descriptions, :summary, :about_summary_key

    rename_column :answer_jobs, :position, :job_post_key
    rename_column :answer_jobs, :domain, :job_domain_key
    rename_column :answer_jobs, :cpy_name, :job_cpy_key
    rename_column :answer_jobs, :cpy_location, :job_cpy_loc_key
    rename_column :answer_jobs, :cpy_domain, :job_cpy_domain_key
    rename_column :answer_jobs, :start, :job_start_key
    rename_column :answer_jobs, :finish, :job_finish_key
    rename_column :answer_jobs, :time, :job_time_key
    rename_column :answer_jobs, :activities, :job_respon_key
    rename_column :answer_jobs, :achievements, :job_realiz_key

    rename_column :answer_internships, :position, :stag_post_key
    rename_column :answer_internships, :domain, :stag_domain_key
    rename_column :answer_internships, :cpy_name, :stag_cpy_key
    rename_column :answer_internships, :cpy_location, :stag_cpy_loc_key
    rename_column :answer_internships, :cpy_domain, :stag_cpy_domain_key
    rename_column :answer_internships, :start, :stag_start_key
    rename_column :answer_internships, :finish, :stag_finish_key
    rename_column :answer_internships, :time, :stag_time_key
    rename_column :answer_internships, :activities, :stag_activ_key
    rename_column :answer_internships, :achievements, :stag_aport_key

    rename_column :answer_volunteerings, :name, :volunt_name_key
    rename_column :answer_volunteerings, :volunteering_type, :volunt_type_key
    rename_column :answer_volunteerings, :role_type, :volunt_role_key
    rename_column :answer_volunteerings, :org_role, :volunt_org_key
    rename_column :answer_volunteerings, :start, :volunt_start_key
    rename_column :answer_volunteerings, :finish, :volunt_finish_key
    rename_column :answer_volunteerings, :time, :volunt_time_key
    rename_column :answer_volunteerings, :responsibilities, :volunt_resp_key
    rename_column :answer_volunteerings, :achievements, :volunt_realiz_key

    rename_column :answer_language_competences, :language, :lang_name_key
    rename_column :answer_language_competences, :level, :lang_level_key

    rename_column :answer_professional_competences, :description, :cprof_position_key
    rename_column :answer_professional_competences, :evaluation, :cprof_eval_key
    rename_column :answer_professional_competences, :project, :cprof_proj_key

    rename_column :answer_personal_efficiencies, :description, :epers_help_key
    rename_column :answer_personal_efficiencies, :evaluation, :epers_eval_key
    rename_column :answer_personal_efficiencies, :project, :epers_proj_key

    rename_column :answer_professional_schools, :inst_name, :pschool_name_key
    rename_column :answer_professional_schools, :inst_location, :pschool_loc_key
    rename_column :answer_professional_schools, :speciality, :pschool_spec_key
    rename_column :answer_professional_schools, :start, :pschool_start_key
    rename_column :answer_professional_schools, :finish, :pschool_finish_key

    rename_column :answer_colleges, :inst_name, :coleg_name_key
    rename_column :answer_colleges, :inst_location, :coleg_loc_key
    rename_column :answer_colleges, :speciality, :coleg_spec_key
    rename_column :answer_colleges, :start, :coleg_start_key
    rename_column :answer_colleges, :finish, :coleg_finish_key

    rename_column :answer_bachelors, :inst_name, :bach_univer_key
    rename_column :answer_bachelors, :inst_country, :bach_loc_key
    rename_column :answer_bachelors, :speciality, :bach_spec_key
    rename_column :answer_bachelors, :start, :bach_start_key
    rename_column :answer_bachelors, :finish, :bach_finish_key
    rename_column :answer_bachelors, :domain, :bach_domain_key

    rename_column :answer_masters, :inst_name, :master_univer_key
    rename_column :answer_masters, :inst_country, :master_loc_key
    rename_column :answer_masters, :speciality, :master_spec_key
    rename_column :answer_masters, :start, :master_start_key
    rename_column :answer_masters, :finish, :master_finish_key
    rename_column :answer_masters, :domain, :master_domain_key
    rename_column :answer_masters, :faculty, :master_faculty_key

    rename_column :answer_doctorates, :inst_name, :doct_univer_key
    rename_column :answer_doctorates, :inst_country, :doct_loc_key
    rename_column :answer_doctorates, :speciality, :doct_spec_key
    rename_column :answer_doctorates, :start, :doct_start_key
    rename_column :answer_doctorates, :finish, :doct_finish_key
    rename_column :answer_doctorates, :domain, :doct_domain_key
    rename_column :answer_doctorates, :faculty, :doct_faculty_key

    rename_column :answer_competitions, :name, :conc_name_key
    rename_column :answer_competitions, :comp_type, :conc_type_key
    rename_column :answer_competitions, :organized_at, :conc_time_key
    rename_column :answer_competitions, :prizes, :conc_win_key

    rename_column :answer_courses, :description, :course_help_key
    rename_column :answer_courses, :duration, :course_time_key
    rename_column :answer_courses, :start, :course_when_key
    rename_column :answer_courses, :tutoring_party, :course_inst_key  

    rename_column :answer_qualifications, :description, :cal_position_key
    rename_column :answer_qualifications, :domain, :cal_domain_key
    rename_column :answer_qualifications, :certified_by, :cal_inst_key
    rename_column :answer_qualifications, :certified_at, :cal_date_key 

    rename_column :answer_hobbies, :description, :hobby_work_key
  end
end
