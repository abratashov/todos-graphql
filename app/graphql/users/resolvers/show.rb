module Users
  module Resolvers
    class Show < Lib::Resolvers::Base
      type Lib::Objects::User, null: true

      argument :id, ID, required: true

      def resolve(**args)
        run Users::Show, args
        @model
      end
    end
  end
end
