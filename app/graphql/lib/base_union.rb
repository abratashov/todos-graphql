module Lib
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class(Lib::BaseEdge)
    connection_type_class(Lib::BaseConnection)
  end
end
