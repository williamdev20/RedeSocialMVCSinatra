require "sequel"
require "sequel/extensions/migration"
require_relative "../config/database"

Sequel::Migrator.run(DB, "db/migrate")