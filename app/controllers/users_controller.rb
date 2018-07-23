class UsersController < ApplicationController
  before_action :set_user, only: %I[index show create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @new_user = User.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @new_user = User.new(user_params)
    @new_user.assign_attributes(password: SecureRandom.uuid.truncate(10), user_id: @user&.id)
    respond_to do |format|
      if @new_user.save
        @user = @new_user
        @user.recent = true
        format.html { redirect_to user_path(id: @user.invitation_code, recent: true), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @new_user }
      else
        format.html { render :new }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(invitation_code: (params[:id] || params.dig(:user, :invitation_code)))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :invitation_code, :user_id, :phone, :name)
    end
end
