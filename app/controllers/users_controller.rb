class UsersController < ApplicationController


	def new
		@user = User.new
	end

	def create
    @user = User.new(user_params)
    @user.save
    p @user
    redirect_to user_path(@user.id)
  end

  def show
  	@user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name,
      	:last_name,
      	:email,
      	:password,
      	:phone_number)
    end
	
end
