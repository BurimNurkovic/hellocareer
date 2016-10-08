require 'json'
require 'time'

json_data = File.read("#{ARGV[0]}")
resumes = JSON.parse(json_data)
i = 0
for resume in resumes
  user_id = resume['user_id']
  begin
    user = User.find(user_id)

    r = user.resumes.create

    position = resume['position']
    unless position == '' or position.nil?
      r_position = Answer::Position.create(
        :resume_id => r.id,
        :pos_domain_key => position['pos_domain_key'],
        :pos_position_key => position['pos_position_key'],
        :pos_apply_key => position['pos_apply_key']
      )
    end

    personal = resume['short_description']
    unless personal == '' or personal.nil?
      r_personal = Answer::ShortDescription.create(
          :resume_id => r.id,
          :about_surname_key => personal['about_surname_key'],
          :about_name_key => personal['about_name_key'],
          :about_email_key => personal['about_email_key'],
          :about_live_key => personal['about_live_key'],
          :about_tel_key => personal['about_tel_key'],
          :about_blog_key => personal['about_blog_key'],
          :about_summary_key => personal['about_summary_key']
        )
    end

    volunteerings = resume['volunteerings']
    unless volunteerings.nil? or volunteerings.empty?
      for volunteering in volunteerings
        start_time = nil
        begin
          start_time = DateTime.strptime(volunteering['volunt_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(volunteering['volunt_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_volunteering = Answer::Volunteering.create(
          :resume_id => r.id,
          :volunt_type_key => volunteering['volunt_type_key'],
          :volunt_role_key => volunteering['volunt_role_key'],
          :volunt_org_key => volunteering['volunt_org_key'],
          :volunt_start_key => start_time.nil? ? nil : start_time,
          :volunt_finish_key => finish_time.nil? ? nil : finish_time,
          :volunt_time_key => volunteering['volunt_time_key'],
          :volunt_resp_key => volunteering['volunt_resp_key'],
          :volunt_realiz_key => volunteering['volunt_realiz_key']
        )
      end
    end

    jobs = resume['jobs']
    unless jobs.nil? or jobs.empty?
      for job in jobs
        start_time = nil
        begin
          start_time = DateTime.strptime(job['job_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(job['job_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_work = Answer::Job.create(
          :resume_id => r.id,
          :job_post_key => job['job_post_key'],
          :job_domain_key => job['job_domain_key'],
          :job_cpy_key => job['job_cpy_key'],
          :job_cpy_loc_key => job['job_cpy_loc_key'],
          :job_start_key => start_time.nil? ? nil : start_time,
          :job_finish_key => finish_time.nil? ? nil : finish_time,
          :job_time_key => job['job_time_key'],
          :job_respon_key => job['job_respon_key'],
          :job_realiz_key => job['job_realiz_key']
        )
      end
    end

    internships = resume['internships']
    unless internships.nil? or internships.empty?
      for internship in internships
        start_time = nil
        begin
          start_time = DateTime.strptime(internship['start_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(internship['stag_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_work = Answer::Internship.create(
          :resume_id => r.id,
          :stag_position_key => internship['stag_position_key'],
          :stag_domain_key => internship['stag_domain_key'],
          :stag_cpy_key => internship['stag_cpy_key'],
          :stag_cpy_loc_key => internship['stag_cpy_loc_key'],
          :stag_cpy_domain_key => internship['stag_cpy_domain_key'],
          :start_start_key => start_time.nil? ? nil : start_time,
          :stag_finish_key => finish_time.nil? ? nil : finish_time,
          :stag_time_key => internship['stag_time_key'],
          :stag_activ_key => internship['stag_activ_key'],
          :stag_aport_key => internship['stag_aport_key']
        )
      end
    end

    language_competences = resume['language_competences']
    unless language_competences.nil? or language_competences.empty?
      for language in language_competences
        r_language = Answer::LanguageCompetence.create(
          :resume_id => r.id,
          :lang_name_key => language['lang_name_key'],
          :lang_level_key => language['lang_level_key']
        )
      end
    end

    professional_competences = resume['professional_competences']
    unless professional_competences.nil? or professional_competences.empty?
      for competence in professional_competences
        r_competence = Answer::ProfessionalCompetence.create(
          :resume_id => r.id,
          :cprof_position_key => competence['cprof_position_key'],
          :cprof_eval_key => competence['cprof_eval_key'].to_i,
          :cprof_proj_key => competence['cprof_proj_key']
        )
      end
    end

    personal_efficiencies = resume['personal_efficiencies']
    unless personal_efficiencies.nil? or personal_efficiencies.empty?
      for efficiency in personal_efficiencies
        r_competence = Answer::PersonalEfficiency.create(
          :resume_id => r.id,
          :epers_help_key => efficiency['epers_help_key'],
          :epers_eval_key => efficiency['epers_eval_key'].to_i,
          :epers_proj_key => efficiency['epers_proj_key']
        )
      end
    end

    professional_schools = resume['professional_schools']
    unless professional_schools.nil? or professional_schools.empty?
      for school in professional_schools
        start_time = nil
        begin
          start_time = DateTime.strptime(school['pschool_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(school['pschool_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_pre_license = Answer::ProfessionalSchool.create(
          :resume_id => r.id,
          :pschool_name_key => school['pschool_name_key'],
          :pschool_loc_key => school['pschool_loc_key'],
          :pschool_spec_key => school['pschool_spec_key'],
          :pschool_start_key => start_time.nil? ? nil : start_time,
          :pschool_finish_key => finish_time.nil? ? nil : finish_time
        )
      end
    end

    colleges = resume['colleges']
    unless colleges.nil? or colleges.empty?
      for college in colleges
        start_time = nil
        begin
          start_time = DateTime.strptime(college['coleg_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(college['coleg_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_pre_license = Answer::College.create(
          :resume_id => r.id,
          :coleg_name_key => college['coleg_name_key'],
          :coleg_loc_key => college['coleg_loc_key'],
          :coleg_spec_key => college['coleg_spec_key'],
          :coleg_start_key => start_time.nil? ? nil : start_time,
          :coleg_finish_key => finish_time.nil? ? nil : finish_time
        )
      end
    end

    bachelors = resume['bachelors']
    unless bachelors.nil? or bachelors.empty?
      for bachelor in bachelors
        start_time = nil
        begin
          start_time = DateTime.strptime(bachelor['bach_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(bachelor['bach_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_pre_license = Answer::Bachelor.create(
          :resume_id => r.id,
          :bach_univer_key => bachelor['bach_univer_key'],
          :bach_loc_key => bachelor['bach_loc_key'],
          :bach_spec_key => bachelor['bach_spec_key'],
          :bach_domain_key => bachelor['bach_domain_key'],
          :bach_start_key => start_time.nil? ? nil : start_time,
          :bach_finish_key => finish_time.nil? ? nil : finish_time
        )
      end
    end

    masters = resume['masters']
    unless masters.nil? or masters.empty?
      for master in masters
        start_time = nil
        begin
          start_time = DateTime.strptime(master['master_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(master['master_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_pre_license = Answer::Master.create(
          :resume_id => r.id,
          :master_univer_key => master['master_univer_key'],
          :master_loc_key => master['master_loc_key'],
          :master_spec_key => master['master_spec_key'],
          :master_domain_key => master['master_domain_key'],
          :master_faculty_key => master['master_faculty_key'], 
          :master_start_key => start_time.nil? ? nil : start_time,
          :master_finish_key => finish_time.nil? ? nil : finish_time
        )  
      end
    end

    doctorates = resume['doctorates']
    unless doctorates.nil? or doctorates.empty?
      for doctorate in doctorates
        start_time = nil
        begin
          start_time = DateTime.strptime(doctorate['doct_start_key'], "%d/%m/%Y")
        rescue => e
        end
        finish_time = nil
        begin
          finish_time = DateTime.strptime(doctorate['doct_finish_key'], "%d/%m/%Y")
        rescue => e
        end
        r_pre_license = Answer::Doctorate.create(
          :resume_id => r.id,
          :doct_univer_key => doctorate['doct_univer_key'],
          :doct_loc_key => doctorate['doct_loc_key'],
          :doct_spec_key => doctorate['doct_spec_key'],
          :doct_domain_key => doctorate['doct_domain_key'],
          :doct_faculty_key => doctorate['doct_faculty_key'], 
          :doct_start_key => start_time.nil? ? nil : start_time,
          :doct_finish_key => finish_time.nil? ? nil : finish_time
        ) 
      end
    end

    competitions = resume['competitions']
    unless competitions.nil? or competitions.empty?
      for competition in competitions
        organized_at = nil
        begin
          organized_at = DateTime.strptime(competition['conc_time_key'], "%d/%m/%Y")
        rescue => e
        end
        r_competition = Answer::Competition.create(
          :resume_id => r.id,
          :conc_name_key => competition['conc_name_key'],
          :conc_type_key => competition['conc_type_key'],
          :conc_time_key => organized_at.nil? ? nil : organized_at,
          :conc_win_key => competition['conc_win_key']
        )
      end
    end

    courses = resume['courses']
    unless courses.nil? or courses.empty?
      for course in courses
        start_time = nil
        begin
          start_time = DateTime.strptime(course['course_when_key'], "%d/%m/%Y")
        rescue => e
        end
        r_course = Answer::Course.create(
          :resume_id => r.id,
          :course_help_key => course['course_help_key'],
          :course_time_key => course['course_time_key'],
          :course_when_key => start_time.nil? ? nil : start_time,
          :course_inst_key => course['course_inst_key']
        )
      end
    end

    qualifications = resume['qualifications']
    unless qualifications.nil? or qualifications.empty?
      for qualification in qualifications
        certified_at = nil
        begin
          certified_at = DateTime.strptime(qualification['cal_date_key'], "%d/%m/%Y")
        rescue => e
        end
        r_qualification = Answer::Qualification.create(
          :resume_id => r.id,
          :cal_position_key => qualification['cal_position_key'],
          :cal_domain_key => qualification['cal_domain_key'],
          :cal_inst_key => qualification['cal_inst_key'],
          :cal_date_key => certified_at.nil? ? nil : certified_at
        )
      end
    end

    hobbies = resume['hobbies']
    unless hobbies.nil? or hobbies.empty?
      for hobby in hobbies
        r_hobby = Answer::Hobby.create(
          :resume_id => r.id,
          :hobby_work_key => hobby['hobby_work_key']
        )
      end
    end
    i += 1
    puts "#{i} resumes transferred"

  rescue => error
    puts error.message
  end
end


