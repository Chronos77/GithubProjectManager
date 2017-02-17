class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def get_resources(url)
    open("#{GITHUB_BASE_URL}#{url}",
      "Accept" => "application/vnd.github.v3+json",
      "Authorization" => "token #{session[:github_token]}").read    
  end
end
