 class CallbacksController < Devise::OmniauthCallbacksController
  def github
    omniauth = request.env["omniauth.auth"]
    user = User.from_omniauth(omniauth)
    session[:github_token] = omniauth.credentials.token
    user.confirm
    sign_in_and_redirect(user)
  end
end