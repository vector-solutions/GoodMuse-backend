class UserMailer < ApplicationMailer
	default from: 'admin@goodmuse.com'

	def forgot_password(user,new_password, token)
		@user = user
		@new_password = new_password
		@token = token
		mail(to: @user.email, 
			subject: 'Forgot Paassword Email.'
			)
	end

	def sign_up(user)
		@user = user
		mail(to: @user.email, 
			subject: 'Signup Email'
			)
	end

end
