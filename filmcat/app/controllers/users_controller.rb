class UsersController < ApplicationController

	def index
		@users = User.all 
	end

	def new
		@user = User.new()
	end

	def show
		#@user = User.find(params[:user])
	end

	def create
		
	end

	def destroy
	end
end
