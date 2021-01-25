module Lib
  module Objects
    class Base < GraphQL::Schema::Object
      edge_type_class(Lib::BaseEdge)
      connection_type_class(Lib::BaseConnection)
      field_class Lib::BaseField
    end
  end
end
