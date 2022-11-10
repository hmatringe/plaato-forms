# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_10_131128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "access_scopes"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  create_table "submissions", force: :cascade do |t|
    t.jsonb "payload", default: {}, null: false
    t.integer "kind"
    t.integer "state", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "roi_number_of_fermenters"
    t.string "roi_weekly_manual_sampling_per_fermenter"
    t.string "roi_per_samples_liquid_tapped_volume"
    t.string "roi_salary_per_hour"
    t.string "roi_minutes_per_sample"
    t.string "roi_average_revenue_per_liquid_unit"
    t.string "roi_money_spent_on_manual_sampling"
    t.string "roi_manual_sampling_time_lost"
    t.string "roi_manual_sampling_liquid_lost"
    t.string "roi_total_capacity"
    t.string "roi_batches_count_per_year_per_fermenter"
    t.string "roi_normal_fermentation_cycle_length"
    t.string "roi_hours_saved_per_batch"
    t.string "roi_revenue_per_liquid_unit"
    t.string "roi_production_increase_percent"
    t.string "roi_production_increase_sales"
    t.string "roi_currency"
    t.string "roi_liquid_unit"
    t.string "email"
    t.string "roi_total_capacity_unit"
  end

end
