class Api::V1::TalksController < Api::V1::ApiController

  before_action :authenticate_user, only: [:create, :destroy, :update]    
  before_action :set_talk, only: [:show, :update, :destroy]
  before_action :is_event_owner?, only: :update

  def show
    render json: @talk.as_json(include:[:users, :comments])
  end

  def create
    @talk = Talk.new(talk_params.merge(user: current_user))
    
    if @talk.save
      render json: @talk, status: :created
    else
      render json: @talk.errors, status: :unprocessable_entity
    end
  end

  def update
    if @talk.update(talk_params)
      render json: @talk
    else
      render json: @talk.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @talk.destroy  
  end

  private

    def set_talk
      @talk = Talk.find(params[:id])
    end

    def talk_params
      params.require(:talk).permit(:title, :description, :begin_date, :end_date, :event_id)
    end

    def is_event_owner?
      event = Event.find(talk_params[:event_id])
      unless event.user == current_user
        raise CanCan::AccessDenied.new("Not authorized!")        
      end
    end
end
