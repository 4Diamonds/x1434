class Admin::UsersController <AdminController

	def index
		@users = User.all
	end

	def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to [:admin, :users], notice: 'User was successfully created.'
    else
      render action: :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to [:admin, :users], notice: 'User was successfully updated.'
    else
      render action: :edit
    end
  end

  def user_activate
    @user = User.find(params[:id])
    @user.user_activate!
    redirect_to [:admin, :users]
  end

  def user_desactivate
    @user = User.find(params[:id])
    @user.user_desactivate!
    redirect_to [:admin, :users]
  end
    
end  