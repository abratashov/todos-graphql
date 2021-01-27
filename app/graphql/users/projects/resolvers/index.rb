module Users::Projects::Resolvers
  class Index < ::Lib::Resolvers::Base
    type [Lib::Objects::Project], null: true

    def resolve
      run ::Users::Projects::Index
      @model
    end
  end
end
