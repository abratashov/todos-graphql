module Lib
  class MutationType < Lib::Objects::Base
    field :userCreate, mutation: Users::Mutations::Create

    field :sessionCreate, mutation: Sessions::Mutations::Create

    field :projectCreate, mutation: Projects::Mutations::Create
    field :projectUpdate, mutation: Projects::Mutations::Update
    field :projectDestroy, mutation: Projects::Mutations::Destroy

    field :createTask, mutation: Tasks::Mutations::Create
    field :updateTask, mutation: Tasks::Mutations::Update
    field :destroyTask, mutation: Tasks::Mutations::Destroy

    field :commentCreate, mutation: Comments::Mutations::Create
    field :destroyComment, mutation: Comments::Mutations::Destroy
  end
end
