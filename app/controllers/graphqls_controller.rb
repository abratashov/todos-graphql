class GraphqlsController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def create
    run Graphql::Execute
    render json: @model
  rescue => error
    raise error unless Rails.env.development?
    handle_error_in_development error
  end

  private

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: { errors: [{ message: error.message, backtrace: error.backtrace }], data: {} },
           status: :internal_server_error
  end
end
