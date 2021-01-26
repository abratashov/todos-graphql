class Comments::Mutations::Destroy < Lib::Mutations::WithUserAuthentication
  graphql_name 'destroyComment'
  description 'Delete comment'

  argument :id, ID, required: true

  field :errors, [Lib::Objects::Error], null: false

  def resolve(**args)
    run ::Comments::Destroy, args

    { errors: [] }
  end
end
