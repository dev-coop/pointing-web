class Api::V1::ApiController < ApplicationController
  before_action :authenticate

  private
  def authenticate
    if Rails.env.development?
      # TODO accept token via url param
      true
    else
      # TODO reenable token requirement
#      authenticate_or_request_with_http_token do |token, options|
        # TODO check token
        true
#      end
    end
  end

end