class UsersController < ApplicationController
  def update
    if current_user.update_attributes(user_params)
      flash[:success] = "Successfully updated"
    end
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end
end
