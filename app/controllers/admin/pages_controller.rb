class Admin::PagesController < AdminController

	def index
		@pages = Page.all
		@likes = @pages.count(:group=>"page_id")
	end

	def page_activate
		@page = Page.find(params[:id])
		@page.page_activate!
		redirect_to [:admin, :pages]	
	end

	def page_desactivate
		@page = Page.find(params[:id])
		@page.page_desactivate!
		redirect_to [:admin, :pages]
	end
end
	

