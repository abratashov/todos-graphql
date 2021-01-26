module CreateSessionSchema
  NotFound = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:sessionCreate).value(:none?)
    end
    required(:errors).each do
      schema do
        required(:message).filled(eql?: "Couldn't find User")
        required(:locations).each do
          required(:line).filled(:int?)
          required(:column).filled(:int?)
        end
        required(:path).value(type?: Array).each(:str?)
      end
    end
  end

  WrongPassword = Dry::Validation.Schema do
    input :hash?

    required(:data).schema do
      required(:sessionCreate).value(:none?)
    end
    required(:errors).each do
      schema do
        required(:message).filled(eql?: 'You entered wrong email or password')
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
      required(:sessionCreate).schema do
        required(:user).schema do
          required(:id).filled(:str?)
          required(:email).filled(:str?)
        end
        required(:token).filled(:str?)
      end
    end
  end
end
