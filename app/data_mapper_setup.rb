require 'data_mapper'
require "dm-postgres-adapter"
require "pg"
require_relative './models/user'
require_relative './models/link'
require_relative './models/tag'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
