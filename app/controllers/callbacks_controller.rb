 class CallbacksController < Devise::OmniauthCallbacksController
  def github
    omniauth = request.env["omniauth.auth"]
    session[:github_token] = omniauth.credentials.token
    render json: get_resources('/user/orgs')
  end
end