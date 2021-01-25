module Lib
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Lib::BaseArgument
    field_class Lib::BaseField
    input_object_class Lib::BaseInputObject
    object_class Lib::Objects::Base
  end
end
