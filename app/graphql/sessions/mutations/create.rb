module Sessions
  module Mutations
    class Create < Lib::Mutations::Base
      graphql_name 'sessionCreate'
      description 'Sign In'

      argument :email, String, required: true
      argument :password, String, required: true

      field :user, Lib::Objects::User, null: true
      field :token, String, null: true

      def resolve(**args)
        result = run Sessions::Create, args

        return { user: result[:model], token: result[:token] } if result.success?

        raise GraphQL::ExecutionError, 'You entered wrong email or password'
      end
    end
  end
end
