require "rubygems"
require "sequel"
require "hash_dot"
require "sqlite3"
require "yaml"

require_relative "modules/insert"
include Inserting

@config = YAML.load_file("config.yml").to_dot   #определяем файл настроек
@data = YAML.load_file("data.yml").to_dot       #определяем файл данных

DB = Sequel.connect(                            #подключаем нашу базу данных, используя выбранный файл настройки
    :adapter => 'mysql2',
    :host => @config.db_host,
    :database => @config.db_name,
    :user => @config.db_user,
    :password => @config.db_password)
)


if DB.tables.include? :cities                   #проверка, существует ли таблица городов: если да, то сносим и пересоздаем
    DB.drop_table :cities

DB.create_table :cities do
  primary_key :id AUTOINCREMENT
  String :city_name
  String :city_country
end

if DB.tables.include? :students                 #аналогично с таблицей студентов
    DB.drop_table :students

DB.create_table :students do
    primary_key :student_id AUTOINCREMENT
    String :name
    String :surname
    Integer :course
    TrueClass :is_male
    foreign_key :city_id
end

cities = DB[:cities]                            #будем использовать созданные таблицы
students = DB[:students]


insert_cities                                   #заполняем таблицы (см. модуль insert)
insert_students


#теперь сделаем необходимые запросы:

puts "Количество студентов: #{students.count}\n"

puts "Количество студентов-девушек: #{students.where(:is_male => false).count}\n"

puts "Количество студентов из Германии: #{students.where(:city_id => cities.where(:city_country=>'Germany').select(:city_id)).count}\n"

puts "Количество студентов, младше 4 курса: #{students.where(:course < 4).count}\n"

students.where(:name=>'Anna').UPDATE(:course=>3)
students.where(:name=>'Peter').UPDATE(:course=>2)

students.where(:is_male => false & :city_id => cities.where(:city_country=>'Germany').select(:city_id)).DELETE

cities.add_column :mastered => false
students.where(:course => 4).UPDATE(:mastered => true)
