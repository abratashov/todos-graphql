module Lib
  module NodeType
    include Lib::BaseInterface
    # Add the `id` field
    include GraphQL::Types::Relay::NodeBehaviors
  end
end
