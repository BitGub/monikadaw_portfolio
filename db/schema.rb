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

ActiveRecord::Schema.define(version: 20160221215320) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "public",                 default: false, null: false
    t.boolean  "trashed",                default: false, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "category_id", limit: 4
    t.integer  "year",        limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "public",                    default: false, null: false
    t.boolean  "trashed",                   default: false, null: false
  end

  create_table "projects_uploads", id: false, force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "upload_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "projects_uploads", ["project_id"], name: "index_projects_uploads_on_project_id", using: :btree
  add_index "projects_uploads", ["upload_id"], name: "index_projects_uploads_on_upload_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.string   "upload",      limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "position",    limit: 4
    t.integer  "user_id",     limit: 4
    t.boolean  "trashed",                   default: false, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
