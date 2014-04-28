class AccessesController < ApplicationController
  before_action :return_unauthorized_error,
    unless: :check_if_admin, only: [:update]

  def update
    user = find_user
    user.update_access(find_access_change)
    head :ok, content_type: 'text/html'
  end

  private

  def find_user
    User.find(params[:user_id])
  end

  def find_access_change
    params.require(:access).permit(:type, :value)
  end

  def check_if_admin
    current_user.is_admin?
  end

  def return_unauthorized_error
    render nothing: true, status: 401
  end
end
