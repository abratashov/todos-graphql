module CurrentUserSchema
  NotAuthenticated = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:me).value(:none?)
    end
    required(:errors).each do
      schema do
        required(:message).filled(eql?: 'You must be authenticated for this action')
        required(:locations).each do
          required(:line).filled(:int?)
          required(:column).filled(:int?)
        end
        required(:path).value(type?: Array).each(:str?)
      end
    end
  end

  Success = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:me).schema do
        required(:id).filled(:str?)
        required(:email).filled(:str?)
      end
    end
  end
end
