module DestroyTaskSchema
  NotAuthenticated = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:destroyTask).value(:none?)
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

  NotFound = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:destroyTask).value(:none?)
    end
    required(:errors).each do
      schema do
        required(:message).filled(eql?: "Couldn't find Task...")
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
      required(:destroyTask).schema do
        required(:errors).value(type?: Array).value(:empty?)
      end
    end
  end
end
