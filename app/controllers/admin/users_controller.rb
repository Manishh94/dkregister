class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.order(id: :desc)
  end

  def candidate_users
    @users = User.all.select{|a| User.where(user_id: a&.id).count > 10}
  end

end
