require "rubygems"
require "sequel"
require "hash_dot"
require "sqlite3"
require "yaml"

@config = YAML.load_file("config.yml").to_dot
