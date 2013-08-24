# encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "hammer@squarebitshost.com.br "
  
  def invite(invitation)
    @invitation = invitation
    mail(to: invitation.email, subject: 'ClickMySocial Invitation!', reply_to: 'noreply@clickmysocial.com')
  end
  
end