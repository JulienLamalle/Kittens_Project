class ApplicationMailer < ActionMailer::Base
  default from: 'kitties_project@protonmail.com'
  layout 'mailer'
  @url  = 'https://kittens-project.herokuapp.com/'
end
