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

ActiveRecord::Schema.define(version: 20171127000711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "item_id"
    t.text "quantity"
    t.index ["item_id"], name: "index_ingredients_on_item_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "items", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineitems", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "list_id"
    t.index ["item_id"], name: "index_lineitems_on_item_id"
    t.index ["list_id"], name: "index_lineitems_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.text "name", null: false
    t.integer "servings", null: false
    t.integer "duration", null: false
    t.text "directions", null: false
    t.text "new_ingredient_quantity"
    t.text "new_ingredient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
