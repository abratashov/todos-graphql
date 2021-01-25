module Lib
  module Mutations
    class WithUserAuthentication < Lib::Mutations::Base
      def ready?(**_args)
        return true if context[:current_user].present?

        raise Exceptions::AuthenticationError
      end
    end
  end
end
