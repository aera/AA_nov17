class Api::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token

  # The priority for rescue_from is in reverse order.
  # Put more specific errors last and more general errors
  # first.

  # StandardError is the ancestor class of all errors that might
  # because of bugs in our code.
  rescue_from StandardError, with: :standard_error
  # `rescue_from` is method usable controllers to prevent
  # an application from crashing when an error occurs.
  # The first argument is a type of error such as ActiveRecord::RecordNotFound,
  # StandardError, etc.
  # You can provide a 'with:' argument with the name of a method
  # that will called when the error occurs.
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def not_found
    render(
      json: {
        errors: [{
          type: 'NotFound'
        }]
      },
      status: :not_found # :not_found is alias for 404 in rails
    )
  end

  private
  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def current_user
    token_type, token = request.headers["AUTHORIZATION"]&.split(" ") || []

    case token_type&.downcase
    when 'api_key'
      @user ||= User.find_by(api_key: token)
    when 'jwt'
      # `begin .. rescue` allows to prevent the code
      # between `begin` and `rescue` from crashing your application.
      # If anything inside crashes, the code between `rescue .. end`
      # will excute and get access to an error object
      # http://blog.honeybadger.io/a-beginner-s-guide-to-exceptions-in-ruby/
      begin
        payload = JWT.decode(
          token,
          Rails.application.secrets.secret_key_base
        )&.first
        # The payload return from JWT.decode is hash where
        # keys are strings. You can not use symbols to access its values.
        @user ||= User.find(payload["id"])
      rescue JWT::DecodeError => error
        nil
      end
    end
  end
  helper_method :current_user

  # headers: {'authorization' : 'JWT <token>'}
  # headers: {'authorization' : 'API_KEY <token>'}
  def api_key
    request.headers['AUTHORIZATION']
  end

  def authenticate_user!
    head :unauthorized unless current_user.present?
  end

  protected
  # protected is like private except that it prevents
  # descendant classes from using the protected methods.
  def record_not_found(error)
    render(
      json: {
        errors: [{
          type: error.class.to_s,
          message: error.message
        }]
      },
      status: :not_found
    )
  end

  def standard_error(error)
    render(
      json: {
        errors: [{
          type: error.class.to_s,
          message: error.message
        }]
      },
      status: :internal_server_error # <-- Rails alias for status code 500
    )
  end
end





##
