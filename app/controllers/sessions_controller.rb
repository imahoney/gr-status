class SessionsController < ApplicationController
	def create
		logger.info env["omniauth.auth"].to_yaml
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to dashboard_url, notice: "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to dashboard_url, notice: "Signed out!"
	end
end