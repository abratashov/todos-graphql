module Lib
  class MutationType < Lib::Objects::Base
    field :userCreate, mutation: Users::Mutations::Create
    field :sessionCreate, mutation: Sessions::Mutations::Create
  end
end
