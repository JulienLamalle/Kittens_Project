class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_owner?, only: [:show]
  
  def show
    @user = current_user
    if current_user.is_admin
    @products = ProductOrder.all
    else
    @products = ProductOrder.where(order: Order.where(user: current_user))
    end
  end

  private

  def is_owner?
    if current_user.id.to_i != params[:id].to_i
      flash[:danger] = "Vous ne pouvez pas acceder à cette page"
      redirect_to root_path
    end
  end
end
