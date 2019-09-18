# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_918_163_114) do
  create_table 'aliases', force: :cascade do |t|
    t.string 'name', limit: 50, null: false
    t.integer 'person_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['person_id'], name: 'index_aliases_on_person_id'
  end

  create_table 'movie_person_roles', force: :cascade do |t|
    t.integer 'movie_id'
    t.integer 'person_id'
    t.string 'role', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['movie_id'], name: 'index_movie_person_roles_on_movie_id'
    t.index ['person_id'], name: 'index_movie_person_roles_on_person_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'release_year', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'people', force: :cascade do |t|
    t.string 'last_name', limit: 50, null: false
    t.string 'first_name', limit: 50, null: false
    t.string 'gender', limit: 10, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
