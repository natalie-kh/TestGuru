class OctokitClient

  attr_reader :http_client

  ACCESS_TOKEN = 'e4de0c21479ff7dc1130150638ab502a9044ce3f'


  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(options = params.to_json)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end