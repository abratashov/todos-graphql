module Projects::Contract
  class Create < Reform::Form
    include Dry

    property :title
    property :position

    validation do
      required(:title).filled(:str?)
      optional(:position).filled(:int?, gteq?: 0)
    end
  end
end
