class User::PagesController < UserController

  def index
    @pages = current_user.pages
  end

  def new
    @categories = Category.all
    @page = current_user.pages.build
  end

  def create
    @page = current_user.pages.build(params[:page])
    if @page.save
      redirect_to [:user, :pages], notice: "Voce acabou de inserir uma pagina."
    else
      render :new
    end
  end

  def update
    @page = current_user.pages.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to [:user, :pages]
    else
      render action: 'edit'
    end
  end

  def edit
    @page = current_user.pages.find(params[:id])
  end
  
  def fblike
    @page = Page.find_by_token(params[:t])
    current_user.clicks_page(@page)
    @pages = Page.published.where('user_id != ?', current_user.id).includes(:user, :clicks)
    @pages = @pages.select {|page| ((page.owner.coins + page.owner.cash) >= page.value) && !current_user.clicks.where(page_id: page.id).present? }
    @pages = @pages.group_by {|p| p.owner.coins < 1 }
    render partial: 'user/facebook_likes', locals: {pages: @pages}
  end

  def click
    @page = Page.find_by_token(params[:t])
    current_user.clicks_page(@page)
    @pages = Page.published.where('user_id != ?', current_user.id).includes(:user, :clicks)
    @pages = @pages.select {|page| ((page.owner.coins + page.owner.cash) >= page.value) && !current_user.clicks.where(page_id: page.id).present? }
    @pages = @pages.group_by {|p| p.owner.coins < 1 }
    render partial: 'user/facebook_likes', locals: {pages: @pages}
  end

end