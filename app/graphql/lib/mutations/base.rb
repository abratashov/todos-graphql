module Lib
  module Mutations
    class Base < GraphQL::Schema::RelayClassicMutation
      # argument_class Lib::BaseArgument
      # field_class Lib::BaseField
      # input_object_class Lib::BaseInputObject
      # object_class Lib::Objects::Base

      private

      def run(operation, params = nil)
        result = operation.call(
          params: params, object: object, current_user: context[:current_user], context: context
        )
        @model = result[:model]
        result
      end
    end
  end
end
