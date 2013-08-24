class User::ClicksController < UserController

  def index
    @clicks = current_user.clicks.includes(:page)
  end

  def show
    @click = current_user.clicks.find(params[:id])
  end

end