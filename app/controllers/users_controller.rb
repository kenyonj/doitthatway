class UsersController < ApplicationController
  before_action :return_unauthorized_error,
    unless: :check_if_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def destroy
    @user = find_user
    @user.remove
  end

  private

  def find_user
    User.find(params[:id])
  end

  def check_if_admin
    current_user.is_admin?
  end

  def return_unauthorized_error
    render nothing: true, status: 401
  end
end
