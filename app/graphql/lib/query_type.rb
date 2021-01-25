module Lib
  class QueryType < Lib::Objects::Base
    field :user, resolver: Users::Resolvers::Show, description: 'User'
    field :me, resolver: Users::Resolvers::Me, description: 'Current user'
  end
end
