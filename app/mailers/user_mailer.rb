class UserMailer < ApplicationMailer

  def send_new_user_message(user)
    @user = user
    @url  = 'https://kittens-project.herokuapp.com/'
    mail(to: @user.email, subject: "Confirmation d'inscription")
  end
end
