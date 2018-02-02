class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user, only: [:destroy]
  before_action :set_user, only: [:destroy]

  def create
    @user = User.new(user_params)
    
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy    
  end

  def show
    @user = User.find(params[:id])    
    render json: @user.as_json(:except => [:password_digest, :admin, :created_at, :updated_at])
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
