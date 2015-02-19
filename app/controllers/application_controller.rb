class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  {
    NotImplementedError          => 501,
    StandardError                => 500,
    ActiveRecord::RecordInvalid  => 422,
    ActiveRecord::RecordNotFound => 404
  }.each do |klass, status|
    rescue_from(klass) do |e|
      # Don't double-render on already performed actions (like CanCan's ensure auth)
      raise e unless request.format.json? && !performed?

      error = {
        error: e.class.name,
        message: e.message.strip
      }

      render json: error, status: status
    end
  end
end
