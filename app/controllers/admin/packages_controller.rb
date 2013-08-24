class Admin::PackagesController < AdminController

	def index
		@packages = Package.all
		
	end

	def show
		@package = Package.find(params[:id])
	end

	def new
		@package = Package.new
	end

	def edit
		@package = Package.find(params[:id])
	end

	def create
		@package = Package.new(params[:package])
		if @package.save
			redirect_to [:admin, :packages], notice: 'Package was created sucessfully'
		else
			render action: :new
		end
	end

	def update
		@package = Package.find(params[:id])
		if @package.update_attributes(params[:package])
			redirect_to [:admin, :packages], notice: 'Package was updated successfully'
		else
			render action: :edit
		end
	end

	def destroy
		@package = Package.find(params[:id])
		@package.destroy
		redirect_to [:admin, :packages], notice: 'Deleted'
	end	

	def package_activate
		@package = Package.find(params[:id])
		@package.package_activate!
		redirect_to [:admin, :packages]	
	end

	def package_desactivate
		@package = Package.find(params[:id])
		@package.package_desactivate!
		redirect_to [:admin, :packages]
	end

end	