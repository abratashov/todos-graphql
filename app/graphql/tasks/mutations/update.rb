class Tasks::Mutations::Update < Lib::Mutations::WithUserAuthentication
  graphql_name 'updateTask'
  description 'Update task'

  argument :id, ID, required: true
  argument :name, String, required: false
  argument :done, Boolean, required: false
  argument :position, Int, required: false

  field :task, Lib::Objects::Task, null: true
  field :errors, [Lib::Objects::Error], null: false

  def resolve(**args)
    result = run ::Tasks::Update, args

    if result.success?
      { task: result[:model], errors: [] }
    else
      { errors: Lib::Service::ErrorsConverter.call(result['contract.default']) }
    end
  end
end
