class User::CategoriesController < UserController
  
  def show
    @category = Category.find(params[:id])
    @pages = @category.pages.published.where('user_id != ?', current_user.id).includes(:user, :clicks)
    @pages = @pages.select {|page| ((page.owner.coins + page.owner.cash) >= page.value) && !current_user.clicks.where(page_id: page.id).present? }
    @pages = @pages.group_by {|p| p.owner.coins < 1 }
  end
  
end