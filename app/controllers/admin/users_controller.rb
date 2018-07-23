class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.order(id: :desc)
  end

  def candidate_users

  end

end
