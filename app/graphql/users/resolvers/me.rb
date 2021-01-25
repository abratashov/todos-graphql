module Users
  module Resolvers
    class Me < Lib::Resolvers::WithUserAuthentication
      type Lib::Objects::User, null: true

      def resolve
        context[:current_user]
      end
    end
  end
end
