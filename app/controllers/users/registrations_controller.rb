# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.persisted?
      # Generate a new JWT token for the user
      token = JWT.encode({user_id: resource.id}, Rails.application.secrets.secret_key_base)
      # Include the token in the response body
      render json: {
        status: {code: 200, message: 'Signed up successfully', data: resource},
        token: token
      }, status: :ok
    else
      errors = {}
      errors[:email] = resource.errors[:email].first if resource.errors[:email].any?
      errors[:password] = resource.errors[:password].first if resource.errors[:password].any?
      render json: { errors: errors }, status: :unprocessable_entity
    end
  end
end


