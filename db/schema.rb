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

ActiveRecord::Schema.define(version: 20140805015927) do

  create_table "comments", options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: true do |t|
    t.text     "content"
    t.integer  "status"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "like",       default: 0
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "connects", options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: true do |t|
    t.integer  "user_id"
    t.integer  "friend"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  add_index "connects", ["user_id"], name: "index_connects_on_user_id", using: :btree

  create_table "posts", options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "sharewith"
    t.integer  "view"
    t.integer  "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail", default: "nothumbnail.jpg"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "shares", options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shares", ["post_id"], name: "index_shares_on_post_id", using: :btree
  add_index "shares", ["user_id"], name: "index_shares_on_user_id", using: :btree

  create_table "useronlines", options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "useronlines", ["user_id"], name: "index_useronlines_on_user_id", using: :btree

  create_table "users", options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "fullname"
    t.date     "birthday"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status", default: 0
    t.string   "avatar", default: "noavatar"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  create_table "votes", options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: true do |t|
    t.integer  "rate"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["post_id"], name: "index_votes_on_post_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
