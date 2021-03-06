class CostsController < ApplicationController
before_action :find_user

	def find_user
		@user = current_user
	end

	def index
		@costs = @user.costs
	end

	def show
		@cost = @user.costs.find params[:id]
	end

	def new
		@cost = Cost.new
	end

	def create
		@cost = @user.costs.build(cost_params)
		@cost.user = current_user

		if @cost.save
			redirect_to [@user, @cost]
		else
			render 'new'
		end
	end

	def edit
		@cost = @user.costs.find(params[:id])
	end

	def update
		@cost = @user.costs.find params[:id]

		if @cost.update(cost_params)
			redirect_to [@user, @cost]
		else
			render 'edit'
		end
	end

	def destroy
		@cost = @user.costs.find params[:id]
		@cost.destroy

		redirect_to user_costs_path(@user)
	end

private
	def cost_params
		params.require(:cost).permit(:name, :amount, :date, :paid_for, :paid_to)
	end
end