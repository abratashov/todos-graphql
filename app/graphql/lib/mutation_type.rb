module Lib
  class MutationType < Lib::Objects::Base
    field :userCreate, mutation: Users::Mutations::Create
    field :sessionCreate, mutation: Sessions::Mutations::Create
    field :projectCreate, mutation: Projects::Mutations::Create
    field :projectUpdate, mutation: Projects::Mutations::Update
    field :projectDestroy, mutation: Projects::Mutations::Destroy
  end
end
