class UserController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @pages = Page.published.where('user_id != ?', current_user.id).includes(:user, :clicks)
    @pages = @pages.select {|page| ((page.owner.coins + page.owner.cash) >= page.value) && !current_user.clicks.where(page_id: page.id).present? }
    @pages = @pages.group_by {|p| p.owner.coins < 1 }
  end
  
  
  
end