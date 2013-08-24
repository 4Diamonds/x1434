class User::InvitationsController < UserController

  def index
    @invitations = current_user.invitations
  end

  def new
    @invitation = current_user.invitations.build
  end

  def create
    @invitation = current_user.invitations.build(params[:invitation])
    if @invitation.save
      redirect_to [:user, :invitations]
    else
      redirect_to :back, notice: @invitation.errors.full_messages.to_sentence
    end
  end
end
