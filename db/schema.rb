
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170420171922) do
=======
ActiveRecord::Schema.define(version: 20170419154626) do
>>>>>>> master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "title",        null: false
    t.string   "description",  null: false
    t.string   "release_year"
    t.string   "platform",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end
  create_table "reviews", force: :cascade do |t|
    t.string   "body"
    t.integer  "rating",     null: false
    t.integer  "game_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_reviews_on_game_id", using: :btree
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end
end
