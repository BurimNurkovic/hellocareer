# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160420143209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "advertisements", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.text     "body"
    t.string   "type"
    t.boolean  "visible",    default: true
    t.integer  "views",      default: 0
    t.datetime "deadline"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "domain"
  end

  create_table "answer_bachelors", force: :cascade do |t|
    t.string   "bach_univer_key"
    t.string   "bach_loc_key"
    t.string   "bach_spec_key"
    t.string   "bach_domain_key"
    t.datetime "bach_start_key"
    t.datetime "bach_finish_key"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.uuid     "resume_id"
  end

  add_index "answer_bachelors", ["resume_id"], name: "index_answer_bachelors_on_resume_id", using: :btree

  create_table "answer_colleges", force: :cascade do |t|
    t.string   "coleg_name_key"
    t.string   "coleg_loc_key"
    t.string   "coleg_spec_key"
    t.datetime "coleg_start_key"
    t.datetime "coleg_finish_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.uuid     "resume_id"
  end

  add_index "answer_colleges", ["resume_id"], name: "index_answer_colleges_on_resume_id", using: :btree

  create_table "answer_competitions", force: :cascade do |t|
    t.string   "conc_name_key"
    t.string   "conc_type_key"
    t.datetime "conc_time_key"
    t.text     "conc_win_key"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.uuid     "resume_id"
  end

  add_index "answer_competitions", ["resume_id"], name: "index_answer_competitions_on_resume_id", using: :btree

  create_table "answer_courses", force: :cascade do |t|
    t.text     "course_help_key"
    t.string   "course_time_key"
    t.datetime "course_when_key"
    t.string   "course_inst_key"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.uuid     "resume_id"
  end

  add_index "answer_courses", ["resume_id"], name: "index_answer_courses_on_resume_id", using: :btree

  create_table "answer_doctorates", force: :cascade do |t|
    t.string   "doct_univer_key"
    t.string   "doct_loc_key"
    t.string   "doct_spec_key"
    t.string   "doct_domain_key"
    t.string   "doct_faculty_key"
    t.datetime "doct_start_key"
    t.datetime "doct_finish_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.uuid     "resume_id"
  end

  add_index "answer_doctorates", ["resume_id"], name: "index_answer_doctorates_on_resume_id", using: :btree

  create_table "answer_hobbies", force: :cascade do |t|
    t.text     "hobby_work_key"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.uuid     "resume_id"
  end

  add_index "answer_hobbies", ["resume_id"], name: "index_answer_hobbies_on_resume_id", using: :btree

  create_table "answer_internships", force: :cascade do |t|
    t.string   "stag_position_key"
    t.string   "stag_domain_key"
    t.string   "stag_cpy_key"
    t.string   "stag_cpy_loc_key"
    t.string   "stag_cpy_domain_key"
    t.datetime "start_start_key"
    t.datetime "stag_finish_key"
    t.string   "stag_time_key"
    t.text     "stag_activ_key"
    t.text     "stag_aport_key"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.uuid     "resume_id"
  end

  add_index "answer_internships", ["resume_id"], name: "index_answer_internships_on_resume_id", using: :btree

  create_table "answer_jobs", force: :cascade do |t|
    t.string   "job_post_key"
    t.string   "job_domain_key"
    t.string   "job_cpy_key"
    t.string   "job_cpy_loc_key"
    t.string   "job_cpy_domain_key"
    t.datetime "job_start_key"
    t.datetime "job_finish_key"
    t.string   "job_time_key"
    t.text     "job_respon_key"
    t.text     "job_realiz_key"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.uuid     "resume_id"
  end

  add_index "answer_jobs", ["resume_id"], name: "index_answer_jobs_on_resume_id", using: :btree

  create_table "answer_language_competences", force: :cascade do |t|
    t.string   "lang_name_key"
    t.string   "lang_level_key"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.uuid     "resume_id"
  end

  add_index "answer_language_competences", ["resume_id"], name: "index_answer_language_competences_on_resume_id", using: :btree

  create_table "answer_masters", force: :cascade do |t|
    t.string   "master_univer_key"
    t.string   "master_loc_key"
    t.string   "master_spec_key"
    t.string   "master_domain_key"
    t.string   "master_faculty_key"
    t.datetime "master_start_key"
    t.datetime "master_finish_key"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.uuid     "resume_id"
  end

  add_index "answer_masters", ["resume_id"], name: "index_answer_masters_on_resume_id", using: :btree

  create_table "answer_personal_efficiencies", force: :cascade do |t|
    t.text     "epers_help_key"
    t.integer  "epers_eval_key"
    t.string   "epers_proj_key"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.uuid     "resume_id"
  end

  add_index "answer_personal_efficiencies", ["resume_id"], name: "index_answer_personal_efficiencies_on_resume_id", using: :btree

  create_table "answer_positions", force: :cascade do |t|
    t.string   "pos_domain_key"
    t.string   "pos_position_key"
    t.string   "pos_apply_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.uuid     "resume_id"
  end

  add_index "answer_positions", ["resume_id"], name: "index_answer_positions_on_resume_id", using: :btree

  create_table "answer_professional_competences", force: :cascade do |t|
    t.text     "cprof_position_key"
    t.integer  "cprof_eval_key"
    t.string   "cprof_proj_key"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.uuid     "resume_id"
  end

  add_index "answer_professional_competences", ["resume_id"], name: "index_answer_professional_competences_on_resume_id", using: :btree

  create_table "answer_professional_schools", force: :cascade do |t|
    t.string   "pschool_name_key"
    t.string   "pschool_loc_key"
    t.string   "pschool_spec_key"
    t.datetime "pschool_start_key"
    t.datetime "pschool_finish_key"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.uuid     "resume_id"
  end

  add_index "answer_professional_schools", ["resume_id"], name: "index_answer_professional_schools_on_resume_id", using: :btree

  create_table "answer_qualifications", force: :cascade do |t|
    t.text     "cal_position_key"
    t.string   "cal_domain_key"
    t.string   "cal_inst_key"
    t.datetime "cal_date_key"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.uuid     "resume_id"
  end

  add_index "answer_qualifications", ["resume_id"], name: "index_answer_qualifications_on_resume_id", using: :btree

  create_table "answer_short_descriptions", force: :cascade do |t|
    t.string   "about_name_key"
    t.string   "about_surname_key"
    t.string   "about_email_key"
    t.string   "about_live_key"
    t.string   "about_tel_key"
    t.string   "about_blog_key"
    t.text     "about_summary_key"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.uuid     "resume_id"
  end

  add_index "answer_short_descriptions", ["resume_id"], name: "index_answer_short_descriptions_on_resume_id", using: :btree

  create_table "answer_volunteerings", force: :cascade do |t|
    t.string   "volunt_name_key"
    t.string   "volunt_type_key"
    t.string   "volunt_role_key"
    t.string   "volunt_org_key"
    t.datetime "volunt_start_key"
    t.datetime "volunt_finish_key"
    t.string   "volunt_time_key"
    t.text     "volunt_resp_key"
    t.text     "volunt_realiz_key"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.uuid     "resume_id"
  end

  add_index "answer_volunteerings", ["resume_id"], name: "index_answer_volunteerings_on_resume_id", using: :btree

  create_table "benefits", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "logo"
    t.string   "name"
    t.json     "last_searches",          default: {}
  end

  add_index "companies", ["confirmation_token"], name: "index_companies_on_confirmation_token", unique: true, using: :btree
  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "content_boxes", force: :cascade do |t|
    t.string   "key"
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motivational_letters", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "about"
    t.text     "why_position"
    t.text     "why_company"
    t.text     "offer"
    t.text     "benefit"
    t.text     "request"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "type"
    t.integer  "order_nr"
    t.string   "key"
    t.string   "category"
    t.string   "builder_text"
    t.string   "template_text"
    t.string   "tip_text"
    t.json     "special_data"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "searchable",    default: false
  end

  create_table "resume_search_queries", force: :cascade do |t|
    t.integer "data_hash", limit: 8
    t.json    "data"
    t.integer "count",               default: 1
  end

  create_table "resume_templates", force: :cascade do |t|
    t.text     "body_for_pdf"
    t.text     "body_for_html"
    t.string   "handler"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.text     "description"
    t.string   "image"
  end

  create_table "resumes", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "progress"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "views_count", default: 0
  end

  create_table "search_occurrences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "key"
    t.string   "value"
    t.integer  "count",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "searchable_fields",  default: [],                 array: true
    t.string   "visible_fields",     default: [],                 array: true
    t.integer  "search_limit",       default: 0
    t.integer  "premium_points",     default: 0
    t.string   "premium_resume_ids", default: [],                 array: true
    t.boolean  "active",             default: false
    t.datetime "expires_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "terms_chapters", force: :cascade do |t|
    t.integer  "chapter_nr"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "author"
    t.text     "text"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "full_name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
