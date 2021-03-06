class Projects::Mutations::Create < Lib::Mutations::WithUserAuthentication
  graphql_name 'projectCreate'
  description 'Create new project'

  argument :title, String, required: true

  field :project, Lib::Objects::Project, null: true
  field :errors, [Lib::Objects::Error], null: false

  def resolve(**args)
    result = run ::Projects::Create, args

    if result.success?
      { project: @model, errors: [] }
    else
      { errors: Lib::Service::ErrorsConverter.call(result['contract.default']) }
    end
  end
end
