class ApiController < ApplicationController
	before_action :set_default_format

	include ActionController::RequestForgeryProtection
	include ActionController::HttpAuthentication::Token::ControllerMethods

	private
	def set_default_format
		request.format = :json
	end

	def authenticate_token!
		authenticate_with_http_token do |token, options|
			@api_user = User.find_by(api_token: token)
		end
		@api_user ? true : (render json: { error: "HTTP Token: Access Denied" })
	end
end