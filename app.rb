require "rubygems"
require "sequel"
require "hash_dot"
require "sqlite3"
require "yaml"

@config = YAML.load_file("config.yml").to_dot

DB = Sequel.connect(
    :adapter => 'mysql2',
    :host => @config.db_host,
    :user => @config.db_user,
    :password => @config.db_password)
)
