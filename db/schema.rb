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

ActiveRecord::Schema.define(version: 20140107114145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: true do |t|
    t.string   "main_title"
    t.text     "main_text1"
    t.text     "main_text2"
    t.string   "image"
    t.string   "title1"
    t.text     "text1"
    t.string   "title2"
    t.text     "text2"
    t.string   "title3"
    t.text     "text3"
    t.string   "title4"
    t.text     "text4"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abouts", ["language_id"], name: "index_abouts_on_language_id", using: :btree

  create_table "activities", force: true do |t|
    t.string   "name"
    t.text     "text"
    t.string   "link"
    t.string   "image"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["language_id"], name: "index_activities_on_language_id", using: :btree

  create_table "advisors_pages", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.text     "link_text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advisors_pages", ["language_id"], name: "index_advisors_pages_on_language_id", using: :btree

  create_table "articles_sections", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "link_text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles_sections", ["language_id"], name: "index_articles_sections_on_language_id", using: :btree

  create_table "authorizations", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "cocreation_pages", force: true do |t|
    t.text     "text"
    t.string   "image"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cocreation_pages", ["language_id"], name: "index_cocreation_pages_on_language_id", using: :btree

  create_table "cocreations", force: true do |t|
    t.text     "text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "link"
  end

  add_index "cocreations", ["language_id"], name: "index_cocreations_on_language_id", using: :btree

  create_table "communities", force: true do |t|
    t.string   "name"
    t.text     "text"
    t.string   "link"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "communities", ["language_id"], name: "index_communities_on_language_id", using: :btree

  create_table "communities_users", force: true do |t|
    t.integer "community_id"
    t.integer "user_id"
  end

  add_index "communities_users", ["community_id"], name: "index_communities_users_on_community_id", using: :btree
  add_index "communities_users", ["user_id"], name: "index_communities_users_on_user_id", using: :btree

  create_table "community_pages", force: true do |t|
    t.text     "main_text"
    t.string   "image"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "main_text2"
  end

  add_index "community_pages", ["language_id"], name: "index_community_pages_on_language_id", using: :btree

  create_table "contact_pages", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_pages", ["language_id"], name: "index_contact_pages_on_language_id", using: :btree

  create_table "donation_pages", force: true do |t|
    t.string   "main_title"
    t.text     "main_text"
    t.string   "thanks_text"
    t.string   "image1"
    t.string   "title1"
    t.text     "text1"
    t.string   "image2"
    t.string   "title2"
    t.text     "text2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
  end

  add_index "donation_pages", ["language_id"], name: "index_donation_pages_on_language_id", using: :btree

  create_table "donations", force: true do |t|
    t.string   "payer_name"
    t.string   "payment_token"
    t.string   "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value"
    t.boolean  "confirmed",     default: false, null: false
    t.string   "currency"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "place"
    t.date     "date_start"
    t.time     "time"
    t.text     "resume"
    t.text     "info"
    t.text     "join_us_text"
    t.string   "service1_image"
    t.string   "service1_link"
    t.string   "service1_title"
    t.string   "service2_image"
    t.string   "service2_link"
    t.string   "service2_title"
    t.string   "service3_image"
    t.string   "service3_link"
    t.string   "service3_title"
    t.string   "title1"
    t.text     "text1"
    t.string   "title2"
    t.text     "text2"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.boolean  "visible",        default: true, null: false
    t.date     "date_end"
    t.string   "slug"
  end

  add_index "events", ["language_id"], name: "index_events_on_language_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", using: :btree

  create_table "events_sections", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_sections", ["language_id"], name: "index_events_sections_on_language_id", using: :btree

  create_table "events_users", force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id"], name: "index_events_users_on_event_id", using: :btree
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id", using: :btree

  create_table "expert_groups", force: true do |t|
    t.string   "name"
    t.text     "text"
    t.string   "link"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expert_groups", ["language_id"], name: "index_expert_groups_on_language_id", using: :btree

  create_table "expert_groups_pages", force: true do |t|
    t.text     "main_text"
    t.string   "image"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expert_groups_pages", ["language_id"], name: "index_expert_groups_pages_on_language_id", using: :btree

  create_table "expert_groups_users", force: true do |t|
    t.integer "expert_group_id"
    t.integer "user_id"
  end

  add_index "expert_groups_users", ["expert_group_id"], name: "index_expert_groups_users_on_expert_group_id", using: :btree
  add_index "expert_groups_users", ["user_id"], name: "index_expert_groups_users_on_user_id", using: :btree

  create_table "faq_pages", force: true do |t|
    t.text     "text"
    t.string   "image"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faq_pages", ["language_id"], name: "index_faq_pages_on_language_id", using: :btree

  create_table "faq_questions", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faq_questions", ["language_id"], name: "index_faq_questions_on_language_id", using: :btree

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "get_involved_pages", force: true do |t|
    t.text     "main_text"
    t.string   "image"
    t.string   "title1"
    t.text     "text1"
    t.string   "link1"
    t.string   "link1_text"
    t.string   "title2"
    t.text     "text2"
    t.string   "link2"
    t.string   "link2_text"
    t.string   "title3"
    t.text     "text3"
    t.string   "link3"
    t.string   "link3_text"
    t.string   "title4"
    t.text     "text4"
    t.string   "link4"
    t.string   "link4_text"
    t.string   "title5"
    t.text     "text5"
    t.string   "link5"
    t.string   "link5_text"
    t.string   "title6"
    t.text     "text6"
    t.string   "link6"
    t.string   "link6_text"
    t.string   "title7"
    t.text     "text7"
    t.string   "link7"
    t.string   "link7_text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "get_involved_pages", ["language_id"], name: "index_get_involved_pages_on_language_id", using: :btree

  create_table "governance_pages", force: true do |t|
    t.text     "text"
    t.string   "image"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "governance_pages", ["language_id"], name: "index_governance_pages_on_language_id", using: :btree

  create_table "governances", force: true do |t|
    t.string  "name"
    t.string  "link"
    t.text    "text"
    t.integer "language_id"
  end

  create_table "hot_projects_sections", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "link_text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "english_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible",      default: false
    t.string   "slug"
  end

  create_table "missions", force: true do |t|
    t.text     "text"
    t.string   "image"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "missions", ["language_id"], name: "index_missions_on_language_id", using: :btree

  create_table "newsletter_languages", force: true do |t|
    t.string "language"
    t.string "mailchimp_id"
  end

  create_table "organization_pages", force: true do |t|
    t.text     "main_text"
    t.string   "image"
    t.string   "title1"
    t.text     "text1"
    t.string   "title2"
    t.text     "text2"
    t.string   "title3"
    t.text     "text3"
    t.string   "title4"
    t.text     "text4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
  end

  add_index "organization_pages", ["language_id"], name: "index_organization_pages_on_language_id", using: :btree

  create_table "partners", force: true do |t|
    t.string   "partner1"
    t.string   "partner2"
    t.string   "partner3"
    t.string   "partner4"
    t.string   "partner5"
    t.string   "partner6"
    t.string   "partner7"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link1"
    t.string   "link2"
    t.string   "link3"
    t.string   "link4"
    t.string   "link5"
    t.string   "link6"
    t.string   "link7"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "resume"
    t.string   "image"
    t.text     "info"
    t.text     "join_us_text"
    t.string   "service1_image"
    t.string   "service1_link"
    t.string   "service1_title"
    t.string   "service2_image"
    t.string   "service2_link"
    t.string   "service2_title"
    t.string   "service3_image"
    t.string   "service3_link"
    t.string   "service3_title"
    t.text     "text1"
    t.text     "text2"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title1"
    t.string   "title2"
    t.boolean  "visible",        default: true,  null: false
    t.boolean  "featured",       default: false, null: false
    t.string   "slug"
  end

  add_index "projects", ["language_id"], name: "index_projects_on_language_id", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", using: :btree

  create_table "projects_users", force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "take_part_sections", force: true do |t|
    t.string   "main_title"
    t.text     "main_text"
    t.text     "link_text"
    t.string   "title1"
    t.text     "text1"
    t.string   "link1"
    t.string   "title2"
    t.text     "text2"
    t.string   "link2"
    t.string   "title3"
    t.text     "text3"
    t.string   "link3"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
  end

  add_index "take_part_sections", ["language_id"], name: "index_take_part_sections_on_language_id", using: :btree

  create_table "team_pages", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "link_text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_pages", ["language_id"], name: "index_team_pages_on_language_id", using: :btree

  create_table "timelines", force: true do |t|
    t.string   "url"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
  end

  add_index "timelines", ["language_id"], name: "index_timelines_on_language_id", using: :btree

  create_table "top_banners", force: true do |t|
    t.string   "title1"
    t.text     "text1"
    t.string   "title2"
    t.string   "text2"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image1"
    t.string   "link1"
    t.string   "image2"
    t.string   "link2"
  end

  add_index "top_banners", ["language_id"], name: "index_top_banners_on_language_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false, null: false
    t.text     "bio"
    t.string   "locale"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "google_plus_url"
    t.string   "github_url"
    t.string   "linkedin_url"
    t.integer  "profile_type"
    t.string   "title"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "value_pages", force: true do |t|
    t.text    "text"
    t.string  "image"
    t.integer "language_id"
  end

  add_index "value_pages", ["language_id"], name: "index_value_pages_on_language_id", using: :btree

  create_table "values", force: true do |t|
    t.string  "name"
    t.string  "link"
    t.text    "text"
    t.integer "language_id"
  end

  create_table "what_is_sections", force: true do |t|
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.text     "text4"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title1"
    t.string   "title2"
    t.string   "title3"
    t.string   "title4"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "title"
  end

  add_index "what_is_sections", ["language_id"], name: "index_what_is_sections_on_language_id", using: :btree

end
