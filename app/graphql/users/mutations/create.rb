module Users
  module Mutations
    class Create < Lib::Mutations::Base
      graphql_name 'userCreate'
      description 'Create new user (Sign Up)'

      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      field :user, Lib::Objects::User, null: true
      field :errors, [Lib::Objects::Error], null: false

      def resolve(**args)
        result = run Users::Create, args

        if result.success?
          { user: @model, errors: [] }
        else
          { errors: Lib::Service::ErrorsConverter.call(result['contract.default']) }
        end
      end
    end
  end
end

