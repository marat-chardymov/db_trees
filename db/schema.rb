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

ActiveRecord::Schema.define(version: 20180501115818) do

  create_table "adjacency_list_employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "level"
    t.integer "superior_id"
    t.string "technology"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "closure_table_employee_hierarchies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "closure_table_employee_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "closure_table_employee_desc_idx"
  end

  create_table "closure_table_employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "level"
    t.string "technology"
    t.string "role"
    t.integer "superior_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["superior_id"], name: "index_closure_table_employees_on_superior_id"
  end

  create_table "nested_set_employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "level"
    t.string "technology"
    t.string "role"
    t.integer "superior_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lft"], name: "index_nested_set_employees_on_lft"
    t.index ["rgt"], name: "index_nested_set_employees_on_rgt"
    t.index ["superior_id"], name: "index_nested_set_employees_on_superior_id"
  end

end
