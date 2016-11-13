require "rubygems"
require "sequel"
require "hash_dot"
require "sqlite3"
require "yaml"

require_relative "modules/inser"

@config = YAML.load_file("config.yml").to_dot


DB = Sequel.connect(
    :adapter => 'mysql2',
    :host => @config.db_host,
    :database => @config.db_name,
    :user => @config.db_user,
    :password => @config.db_password)
)


if DB.tables.include? :cities
    DB.drop_table :cities

DB.create_table :cities do
  primary_key :id
  String :city_name
  String :city_country
end

if DB.tables.include? :students
    DB.drop_table :students

DB.create_table :students do
    primary_key :student_id
    String :name
    String :surname
    Integer :course
    TrueClass :is_male
    foreign_key :city_id
end

cities = DB[:cities]
students = DB[:students]

insert_cities
insert_students
