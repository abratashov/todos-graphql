module Lib::Objects
  class Task < Lib::Objects::Base
    description 'A task'

    field :id, ID, null: false
    field :name, String, null: false
    field :done, Boolean, null: false
    field :position, Int, null: false
    field :created_at, Lib::Scalars::DateTime, null: false
    field :updated_at, Lib::Scalars::DateTime, null: false
    field :project, Lib::Objects::Project, null: false
    field :project_id, Int, null: false
    field :comments, [Lib::Objects::Comment], null: false
  end
end
