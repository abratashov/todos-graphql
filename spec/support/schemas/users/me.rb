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
        required(:projects).each do
          required(:id).filled(:str?)
          required(:title).filled(:str?)
          required(:tasks).each do
            required(:id).filled(:str?)
            required(:name).filled(:str?)
            required(:done).filled(:bool?)
            required(:comments).each do
              required(:id).filled(:str?)
              required(:body).filled(:str?)
              required(:attachmentUrl).maybe(:str?)
            end
          end
        end
      end
    end
  end
end
