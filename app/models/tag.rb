require 'data_mapper'
# require 'dm-migrations'
# require 'dm-postgres-adapter'

class Tag

  include DataMapper::Resource

  has n, :links, through: Resource

  property :id,     Serial
  property :name,   String

end

# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
#
# DataMapper.finalize
#
# DataMapper.auto_upgrade!
