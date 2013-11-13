class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :create

  def create
    # XXX If I don't have the params I probably want to return an error, but
    #     probably not the one that Rails will give
    resource = User.find_for_database_authentication(email: params[:username])
    return render status: 401, json: {} unless resource

    if resource.valid_password?(params[:password])
      auth_token = AuthToken.create(user: resource, token: Devise.friendly_token)
      return render status: 401, json: {} unless auth_token

      render status: 201, json: { auth_token: auth_token.token }
    else
      warden.custom_failure!
      render status: 401, json: {}
    end
  end

  def destroy
    auth_token = AuthToken.find_by_token(params[:auth_token])
    return render status: 400, json: {} unless auth_token

    if auth_token.destroy
      return render status: 200, json: {} 
    else
      return render status: 400, json: {} 
    end
  end
end
