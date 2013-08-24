# encoding: utf-8
class InvitationsController < ApplicationController
  
  def show
    @invitation = Invitation.find_by_token(params[:id])
    redirect_to [:root] unless @invitation
  end
  
  def accept
    redirect_to [:root] if !request.put?
    @invitation = Invitation.find_by_token(params[:invitation][:token])
    if @invitation.nil? or @invitation.accept?
      redirect_to [:new, :user, :session], notice: 'Este convite já foi aceito!'
    else
      @invitation.accept!
      redirect_to new_user_registration_path(User.new(name: @invitation.name, email: @invitation.email))
    end
  end
  
end