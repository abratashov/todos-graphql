module UpdateTaskSchema
  NotAuthenticated = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:updateTask).value(:none?)
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
      required(:updateTask).value(:none?)
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

  Error = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:updateTask).schema do
        required(:task).value(:none?)
        required(:errors).each do
          schema do
            required(:messages).value(type?: Array).each(:str?)
            required(:path).value(type?: Array).each(:str?)
          end
        end
      end
    end
  end

  Success = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:updateTask).schema do
        required(:task).schema do
          required(:id).filled(:str?)
          required(:name).filled(:str?)
          required(:done).filled(:bool?)
          required(:projectId).filled(:int?)
          required(:createdAt).filled(:str?)
          required(:updatedAt).filled(:str?)
        end
        required(:errors).value(type?: Array).value(:empty?)
      end
    end
  end
end
