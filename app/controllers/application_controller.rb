class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_github

  def set_github
    @github = GithubService.new(session[:github_token])
  end
end
