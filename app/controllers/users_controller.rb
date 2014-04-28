class UsersController < ApplicationController
  before_action :authorize_admin

  def index
    @users = User.all
  end

  def destroy
    @user = find_user
    @user.destroy
  end

  private

  def find_user
    User.find(params[:id])
  end
end
