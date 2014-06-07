class ChoresController < ApplicationController
	# include ApplicationHelper
	def show
		@chore = Chore.find_by_id(params[:id])
		@comments = @chore.comments
	end

	def new
		@chore = Chore.new
	end

	def create
		current_user.created_chores.create(chore_params)
		redirect_to current_user
	end

	def edit
		@chore = Chore.find_by_id(params[:id])
	end

	def update
		@chore = Chore.find_by_id(params[:id])
		@chore.update_attributes(chore_params)

		redirect_to @chore
	end

	def destroy
		@chore = Chore.find_by_id(params[:id])
		@chore.destroy

		redirect_to current_user
	end

	def participate
		@chore = Chore.find_by_id(params[:id])
		current_user.chores << @chore

		redirect_to current_user
	end

private

	def chore_params
    params.require(:chore).permit(:name, :happen_at, :description)
	end
end
