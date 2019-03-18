class Api::SessionsController < ApplicationController

  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.authenticate(params[:password])
      jwt = JWT.encode(
        {
          admin_id: admin.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: admin.email, admin_id: admin.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
