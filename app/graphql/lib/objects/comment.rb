module Lib::Objects
  class Comment < Lib::Objects::Base
    description 'A project'

    field :id, ID, null: false
    field :body, String, null: false
    field :attachment_url, String, null: true
    field :created_at, Lib::Scalars::DateTime, null: false
    field :updated_at, Lib::Scalars::DateTime, null: false
    field :task, Lib::Objects::Task, null: false
    field :task_id, Int, null: false
  end
end
