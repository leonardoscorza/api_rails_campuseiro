class Api::V1::EventUsersController < Api::V1::ApiController
  before_action :authenticate_user, only: [:create, :destroy]
  before_action :set_event_user, only: [:destroy]

  def create
    @event_user = EventUser.new(event_user_params)
    
    if @event_user.save
      render json: @event_user, status: :created
    else
      render json: @event_user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event_user.destroy    
  end

  private

    def set_event_user
      @event_user = EventUser.find(params[:id])
    end

    def event_user_params
      params.require(:event_user).permit(:event_id, :user_id)
    end
end
