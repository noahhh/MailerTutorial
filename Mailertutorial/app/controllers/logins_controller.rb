class LoginsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			if @user.activated?
				session[:current_user_id] = @user.id
				redirect_to root_path, notice: "You have logged in!"
			else
				message  = "Account not activated. "
				message += "Check your email for the activation link."
				flash[:warning] = message
				render :new
			end
		end
	end

	
		def destroy
			session[:current_user_id] = nil
			flash[:notice] = "You logged out"
			redirect_to root_path
		end
		def login_params
			params.require(:login).permit(:email, :password)
		end
end
