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

ActiveRecord::Schema.define(version: 20170316035129) do

  create_table "fan_ids", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "fan_img"
    t.string   "nickname"
    t.string   "msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fan_ids_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                   default: "",                        null: false
    t.string   "image",                  default: "/default-user-image.png", null: false
    t.string   "email",                  default: "",                        null: false
    t.string   "mail",                   default: "",                        null: false
    t.string   "encrypted_password",     default: "",                        null: false
    t.string   "provider_fb"
    t.string   "uid_fb"
    t.string   "image_fb"
    t.string   "url_fb"
    t.string   "provider_tw"
    t.string   "uid_tw"
    t.string   "image_tw"
    t.string   "url_tw"
    t.string   "provider_gg"
    t.string   "uid_gg"
    t.string   "image_gg"
    t.string   "url_gg"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "fan_ids", "users"
end
