# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100323202922) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "incorporation_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "manager_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "department_id"
    t.integer  "company_id"
    t.integer  "title_id"
    t.datetime "hired_on"
    t.datetime "terminated_on"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.integer  "salary"
    t.text     "favorite_color"
    t.text     "plain_fullname"
  end

  create_table "titles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
