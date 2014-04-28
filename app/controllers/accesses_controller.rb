class AccessesController < ApplicationController
  before_action :authorize_admin

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
end
