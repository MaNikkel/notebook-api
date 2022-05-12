class ApplicationController < ActionController::API
  before_action :ensure_json_request

  def ensure_json_request
    return if request.headers['Accept'] =~ /json/
    render body: nil, :status => 406
  end
end
