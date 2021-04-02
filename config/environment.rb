require 'bundler/setup'
Bundler.require(:default)

set(:database, {adapter: "sqlite", database: "db/cosmetics.sqlite"})  

require_all 'app'