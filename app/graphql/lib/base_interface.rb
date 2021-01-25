module Lib
  module BaseInterface
    include GraphQL::Schema::Interface
    edge_type_class(Lib::BaseEdge)
    connection_type_class(Lib::BaseConnection)

    field_class Lib::BaseField
  end
end
