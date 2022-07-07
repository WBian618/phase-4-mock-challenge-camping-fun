class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  private
  def render_not_found_response
      render json: {error: 'Not Found'}, status: :not_found
  end
end
