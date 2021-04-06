require 'bundler/setup'
Bundler.require(:default)

set(:database, {adapter: "sqlite3", database: "db/cosmetics.sqlite3"})  

require_all 'app'