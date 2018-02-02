class Api::V1::TalkUsersController < Api::V1::ApiController
  before_action :authenticate_user, only: [:create, :destroy]
  before_action :set_talk_user, only: [:destroy]

  def create
    @talk_user = TalkUser.new(talk_user_params)
    
    if @talk_user.save
      render json: @talk_user, status: :created
    else
      render json: @talk_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @talk_user.destroy    
  end

  private

    def set_talk_user
      @talk_user = TalkUser.find(params[:id])
    end

    def talk_user_params
      params.require(:talk_user).permit(:talk_id, :user_id)
    end
end
