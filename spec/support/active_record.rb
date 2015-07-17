require 'active_record'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
load File.join(SPEC_DIR, "schema.rb")
