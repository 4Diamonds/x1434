class Admin::ClicksController < AdminController

	def index
		@clicks = Click.all 
	end
	
end	

