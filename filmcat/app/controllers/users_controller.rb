class UsersController < ApplicationController
  def index
  	@users = User.all
  end

	def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new()
  end

  def create
  	@user = User.new(params.require(:user).permit(:name, :email, :password)) 	
  	if @user.save
  	  	redirect_to @user, :notice => "Thanks for registration"
  	else
  		render 'new'
  	end

  end

  def edit 

  end

  def update

  end

  def destroy

  end


end
