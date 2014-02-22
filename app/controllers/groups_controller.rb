class GroupsController < ApplicationController
	def new
		if !logged_in?
			flash[:success] = "We need your contact information before creating a group. Please register below!"
			redirect_to register_path
		end
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			flash[:notice] = "Group Created!"
			redirect_to @group
		else
		end
	end

	def show
		@group = Group.find(params[:id])
	end

	private

	def group_params
		params.require(:group).permit(:instruction, :size)
	end
end