class UserMailer < ApplicationMailer
	default from: 'everybody@appacademy.io'

	def welcome_email(user)
		@user = user # To use in views
		# Mailing to user.username instead of email as there is no email col
		mail(to: user.username, subject: 'Welcome to App Academy!')
	end
end
