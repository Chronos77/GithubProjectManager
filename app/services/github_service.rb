class GithubService
  class_attribute :token

  def initialize(token)
    self.token = token
  end

  def get_resources(resource)
    JSON.parse(open("#{GITHUB_BASE_URL}#{resource}",
      "Accept" => "application/vnd.github.v3+json",
      "Authorization" => "token #{self.token}").read)
  end

  def get_orgs
    self.get_resources('/user/orgs') 
  end

  def get_org_folders(org)
    self.get_resources("/orgs/#{org}/repos")
  end

  def get_user_folders
    self.get_resources("/user/repos")
  end
end