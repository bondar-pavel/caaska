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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130309125314) do

  create_table "credentials", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "ip"
    t.boolean  "ping"
    t.boolean  "ssh"
    t.integer  "network_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "networks", :force => true do |t|
    t.string   "start_ip"
    t.string   "end_ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tools", ["name"], :name => "index_tools_on_name", :unique => true

  create_table "unit_tools", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "tool_id"
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "unit_tools", ["tool_id", "unit_id"], :name => "index_unit_tools_on_tool_id_and_unit_id", :unique => true

  create_table "units", :force => true do |t|
    t.string   "ip"
    t.text     "description"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
