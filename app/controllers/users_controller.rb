class UsersController < ApplicationController

	def index
		#@users = User.all
		if params[:search].present?
			@users = User.where(role: params[:search]).paginate(:per_page => 5, :page => params[:page])
		else
			@users = User.all.paginate(:per_page => 5, :page => params[:page])
		end
	end

	def show
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to users_path
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to users_path
	end

	def destroy
	end

	private 
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :role)
		end
end
